/*
 * Copyright 2020 Google LLC
 *
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */

//#include <d3dcompiler.h>

#include "src/gpu/ganesh/d3d11/GrD3D11ProgramBuilder.h"

#include "include/private/base/SkTemplates.h"
#include "include/gpu/GrDirectContext.h"
#include "src/core/SkReadBuffer.h"
#include "src/core/SkTraceEvent.h"
#include "src/gpu/ganesh/GrAutoLocaleSetter.h"
#include "src/gpu/ganesh/GrDirectContextPriv.h"
#include "src/gpu/ganesh/GrPersistentCacheUtils.h"
#include "src/gpu/ganesh/GrShaderCaps.h"
#include "src/gpu/ganesh/GrStencilSettings.h"
#include "src/gpu/ganesh/effects/GrTextureEffect.h"

#include "src/gpu/ganesh/d3d11/GrD3D11Gpu.h"
#include "src/gpu/ganesh/d3d11/GrD3D11Texture.h"
#include "src/sksl/SkSLCompiler.h"
#include "include/private/SkSLProgramKind.h"
#include "src/sksl/SkSLProgramSettings.h"
#include "src/utils/SkShaderUtils.h"

#include <d3dcompiler.h>

GrD3D11Program::GrD3D11Program(
        gr_cp<ID3D11VertexShader> vertexShader,
               gr_cp<ID3D11PixelShader> pixelShader,
               gr_cp<ID3D11InputLayout> inputLayout,
               gr_cp<ID3D11BlendState> blendState,
               gr_cp<ID3D11RasterizerState> rasterizerState,
               gr_cp<ID3D11DepthStencilState> depthStencilState,
               const GrGLSLBuiltinUniformHandles& builtinUniformHandles,
               const UniformInfoArray& uniforms,
               uint32_t uniformSize,
               uint32_t numSamplers,
               std::unique_ptr<GrGeometryProcessor::ProgramImpl> gpImpl,
               std::unique_ptr<GrXferProcessor::ProgramImpl> xpImpl,
               std::vector<std::unique_ptr<GrFragmentProcessor::ProgramImpl>> fpImpls,
               size_t vertexStride,
               size_t instanceStride): 
    fNumSamplers(numSamplers), 
    fVertexStride(vertexStride), 
    fInstanceStride(instanceStride), 
    fBuiltinUniformHandles(builtinUniformHandles), 
    fDataManager(uniforms, uniformSize),
    fGPImpl(std::move(gpImpl)),
    fXPImpl(std::move(xpImpl)),
    fFPImpls(std::move(fpImpls)),
    fVertexShader(vertexShader),
    fPixelShader(pixelShader),
    fInputLayout(inputLayout),
    fBlendState(std::move(blendState)),
    fRasterizerState(std::move(rasterizerState)),
    fDepthStencilState(std::move(depthStencilState))
{
}

void GrD3D11Program::setAndBindConstants(GrD3D11Gpu* gpu,
                                             const GrRenderTarget* renderTarget,
                                             const GrProgramInfo& programInfo) {
    this->setRenderTargetState(renderTarget, programInfo.origin());

    fGPImpl->setData(fDataManager, *gpu->caps()->shaderCaps(), programInfo.geomProc());

    for (int i = 0; i < programInfo.pipeline().numFragmentProcessors(); ++i) {
        const auto& fp = programInfo.pipeline().getFragmentProcessor(i);
        fp.visitWithImpls(
                [&](const GrFragmentProcessor& fp, GrFragmentProcessor::ProgramImpl& impl) {
                    impl.setData(fDataManager, fp);
                },
                *fFPImpls[i]);
    }

    programInfo.pipeline().setDstTextureUniforms(fDataManager, &fBuiltinUniformHandles);
    fXPImpl->setData(fDataManager, programInfo.pipeline().getXferProcessor());

    fDataManager.uploadConstants(gpu);
}

void GrD3D11Program::setRenderTargetState(const GrRenderTarget* rt, GrSurfaceOrigin origin) {
    // Set RT adjustment and RT flip
    SkISize dimensions = rt->dimensions();
    SkASSERT(fBuiltinUniformHandles.fRTAdjustmentUni.isValid());
    if (fRenderTargetState.fRenderTargetOrigin != origin ||
        fRenderTargetState.fRenderTargetSize != dimensions) {
        fRenderTargetState.fRenderTargetSize = dimensions;
        fRenderTargetState.fRenderTargetOrigin = origin;

        // The client will mark a swap buffer as kTopLeft when making a SkSurface because
        // D3D's framebuffer space has (0, 0) at the top left. This agrees with Skia's device
        // coords. However, in NDC (-1, -1) is the bottom left. So we flip when origin is kTopLeft.
        bool flip = (origin == kTopLeft_GrSurfaceOrigin);
        std::array<float, 4> v = SkSL::Compiler::GetRTAdjustVector(dimensions, flip);
        fDataManager.set4fv(fBuiltinUniformHandles.fRTAdjustmentUni, 1, v.data());
        if (fBuiltinUniformHandles.fRTFlipUni.isValid()) {
            // Note above that framebuffer space has origin top left. So we need !flip here.
            std::array<float, 2> d = SkSL::Compiler::GetRTFlipVector(rt->height(), !flip);
            fDataManager.set2fv(fBuiltinUniformHandles.fRTFlipUni, 1, d.data());
        }
    }
}

void GrD3D11Program::setAndBindTextures(GrD3D11Gpu* gpu,
                                            const GrGeometryProcessor& geomProc,
                                            const GrSurfaceProxy* const geomProcTextures[],
                                            const GrPipeline& pipeline) {
    SkASSERT(geomProcTextures || !geomProc.numTextureSamplers());

    if (fNumSamplers == 0)
        return;

    UINT startSlot = 0;
    for (int i = 0; i < geomProc.numTextureSamplers(); ++i) {
        SkASSERT(geomProcTextures[i]->asTextureProxy());
        const auto& sampler = geomProc.textureSampler(i);
        auto texture = static_cast<GrD3D11Texture*>(geomProcTextures[i]->peekTexture());
        auto d3d11View = texture->shaderResourceView();
        auto d3d11Sampler = gpu->resourceProvider().findOrCreateCompatibleSampler(sampler.samplerState());

        gpu->deviceContext()->PSSetSamplers(startSlot * 2, 1, &d3d11Sampler);           //GrD3DRootSignature.cpp BaseShaderRegister
        gpu->deviceContext()->PSSetShaderResources(startSlot * 2 + 1, 1, &d3d11View);
        startSlot++;
    }

    if (GrTexture* dstTexture = pipeline.peekDstTexture()) {
        auto texture = static_cast<GrD3D11Texture*>(dstTexture);
        auto d3d11View = texture->shaderResourceView();
        auto d3d11Sampler = gpu->resourceProvider().findOrCreateCompatibleSampler(
                GrSamplerState::Filter::kNearest);

        gpu->deviceContext()->PSSetSamplers(startSlot * 2, 1, &d3d11Sampler);
        gpu->deviceContext()->PSSetShaderResources(startSlot * 2 + 1, 1, &d3d11View);
        startSlot++;
    }

    pipeline.visitTextureEffects([&](const GrTextureEffect& te) {
        GrSamplerState samplerState = te.samplerState();
        auto* texture = static_cast<GrD3D11Texture*>(te.texture());
        auto d3d11View = texture->shaderResourceView();
        auto d3d11Sampler =
                gpu->resourceProvider().findOrCreateCompatibleSampler(samplerState);

        gpu->deviceContext()->PSSetSamplers(startSlot * 2, 1, &d3d11Sampler);
        gpu->deviceContext()->PSSetShaderResources(startSlot * 2 + 1, 1, &d3d11View);
        startSlot++;
    });

    SkASSERT(fNumSamplers == startSlot);
}

static void get_blend_factor(const GrProgramInfo& info, float* floatColors) {
    const GrXferProcessor& xferProcessor = info.pipeline().getXferProcessor();
    const skgpu::Swizzle& swizzle = info.pipeline().writeSwizzle();
    const skgpu::BlendInfo& blendInfo = xferProcessor.getBlendInfo();
    skgpu::BlendCoeff srcCoeff = blendInfo.fSrcBlend;
    skgpu::BlendCoeff dstCoeff = blendInfo.fDstBlend;
    if (skgpu::BlendCoeffRefsConstant(srcCoeff) || skgpu::BlendCoeffRefsConstant(dstCoeff)) {
        // Swizzle the blend to match what the shader will output.
        SkPMColor4f blendConst = swizzle.applyTo(blendInfo.fBlendConstant);
        floatColors[0] = blendConst.fR;
        floatColors[1] = blendConst.fG;
        floatColors[2] = blendConst.fB;
        floatColors[3] = blendConst.fA;
    } else {
        memset(floatColors, 0, 4 * sizeof(float));
    }
}

unsigned int get_stencil_ref(const GrProgramInfo& info) {
    GrStencilSettings stencilSettings = info.nonGLStencilSettings();
    unsigned int stencilRef = 0;
    if (!stencilSettings.isDisabled()) {
        if (stencilSettings.isTwoSided()) {
            SkASSERT(stencilSettings.postOriginCCWFace(info.origin()).fRef ==
                     stencilSettings.postOriginCWFace(info.origin()).fRef);
            stencilRef = stencilSettings.postOriginCCWFace(info.origin()).fRef;
        } else {
            stencilRef = stencilSettings.singleSidedFace().fRef;
        }
    }

    return stencilRef;
}

void GrD3D11Program::setBlendState(GrD3D11Gpu* gpu, const GrProgramInfo& programInfo) {
    FLOAT blendFactor[4];
    get_blend_factor(programInfo, blendFactor);
    gpu->deviceContext()->OMSetBlendState(fBlendState.get(), blendFactor, 0xFFFFFFFF);
}

void GrD3D11Program::setDepthStencilState(GrD3D11Gpu* gpu, const GrProgramInfo& programInfo) {
    gpu->deviceContext()->OMSetDepthStencilState(fDepthStencilState.get(),
                                                 get_stencil_ref(programInfo));
}

void GrD3D11Program::setRasterizerState(GrD3D11Gpu* gpu, const GrProgramInfo& programInfo) {
    gpu->deviceContext()->RSSetState(fRasterizerState.get());
}



std::unique_ptr<GrD3D11Program> GrD3D11ProgramBuilder::MakeD3D11Program(
        GrD3D11Gpu* gpu,
        const GrProgramDesc& desc,
        const GrProgramInfo& programInfo) {
    // ensure that we use "." as a decimal separator when creating SkSL code
    GrAutoLocaleSetter als("C");

    // create a builder.  This will be handed off to effects so they can use it to add
    // uniforms, varyings, textures, etc
    GrD3D11ProgramBuilder builder(gpu, desc, programInfo);

    if (!builder.emitAndInstallProcs()) {
        return nullptr;
    }

    return builder.finalize();
}

GrD3D11ProgramBuilder::GrD3D11ProgramBuilder(GrD3D11Gpu* gpu,
                                                     const GrProgramDesc& desc,
                                                     const GrProgramInfo& programInfo)
        : INHERITED(desc, programInfo)
        , fGpu(gpu)
        , fVaryingHandler(this)
        , fUniformHandler(this) 
{}

const GrCaps* GrD3D11ProgramBuilder::caps() const {
    return fGpu->caps();
}

SkSL::Compiler* GrD3D11ProgramBuilder::shaderCompiler() const {
    return fGpu->shaderCompiler();
}

void GrD3D11ProgramBuilder::finalizeFragmentSecondaryColor(GrShaderVar& outputColor) {
    outputColor.addLayoutQualifier("location = 0, index = 1");
}

// Print the source code for all shaders generated.
static const bool gPrintSKSL = false;
static const bool gPrintHLSL = false;

static gr_cp<ID3DBlob> GrCompileHLSLShader(GrD3D11Gpu* gpu,
                                           const std::string& hlsl,
                                           SkSL::ProgramKind kind) {
    TRACE_EVENT0("skia.shaders", "driver_compile_shader");
    const char* compileTarget = nullptr;
    switch (kind) {
        case SkSL::ProgramKind::kVertex:
            compileTarget = "vs_5_0";
            break;
        case SkSL::ProgramKind::kFragment:
            compileTarget = "ps_5_0";
            break;
        default:
            SkUNREACHABLE;
    }

    uint32_t compileFlags = 0;
#ifdef SK_DEBUG
    // Enable better shader debugging with the graphics debugging tools.
    compileFlags |= D3DCOMPILE_DEBUG | D3DCOMPILE_SKIP_OPTIMIZATION;
#endif
    // SPRIV-cross does matrix multiplication expecting row major matrices
    compileFlags |= D3DCOMPILE_PACK_MATRIX_ROW_MAJOR;

    gr_cp<ID3DBlob> shader;
    gr_cp<ID3DBlob> errors;
    HRESULT hr = D3DCompile(hlsl.c_str(), hlsl.length(), nullptr, nullptr, nullptr, "main",
                            compileTarget, compileFlags, 0, &shader, &errors);
    if (!SUCCEEDED(hr)) {
        gpu->getContext()->priv().getShaderErrorHandler()->compileError(
                hlsl.c_str(), reinterpret_cast<char*>(errors->GetBufferPointer()));
    }
    return shader;
}

bool GrD3D11ProgramBuilder::loadHLSLFromCache(SkReadBuffer* reader, gr_cp<ID3DBlob> shaders[]) {

    std::string hlsl[kGrShaderTypeCount];
    SkSL::Program::Inputs inputs[kGrShaderTypeCount];

    if (!GrPersistentCacheUtils::UnpackCachedShaders(reader, hlsl, inputs, kGrShaderTypeCount)) {
        return false;
    }

    auto compile = [&](SkSL::ProgramKind kind, GrShaderType shaderType) {
        if (inputs[shaderType].fUseFlipRTUniform) {
            this->addRTFlipUniform(SKSL_RTFLIP_NAME);
        }
        shaders[shaderType] = GrCompileHLSLShader(fGpu, hlsl[shaderType], kind);
        return shaders[shaderType].get();
    };

    return compile(SkSL::ProgramKind::kVertex, kVertex_GrShaderType) &&
           compile(SkSL::ProgramKind::kFragment, kFragment_GrShaderType);
}

gr_cp<ID3DBlob> GrD3D11ProgramBuilder::compileD3D11Program(
        SkSL::ProgramKind kind,
        const std::string& sksl,
        const SkSL::ProgramSettings& settings,
        SkSL::Program::Inputs* outInputs,
        std::string* outHLSL) {
#ifdef SK_DEBUG
    std::string src = SkShaderUtils::PrettyPrint(sksl);
#else
    const std::string& src = sksl;
#endif

    extern int shader_model;
    shader_model = 50;

    std::unique_ptr<SkSL::Program> program = fGpu->shaderCompiler()->convertProgram(
            kind, src, settings);
    if (!program || !fGpu->shaderCompiler()->toHLSL(*program, outHLSL)) {
        auto errorHandler = fGpu->getContext()->priv().getShaderErrorHandler();
        errorHandler->compileError(src.c_str(),
                                   fGpu->shaderCompiler()->errorText().c_str());
        return gr_cp<ID3DBlob>();
    }
    *outInputs = program->fInputs;

    if (gPrintSKSL || gPrintHLSL) {
        SkShaderUtils::PrintShaderBanner(kind);
        if (gPrintSKSL) {
            SkDebugf("SKSL:\n");
            SkShaderUtils::PrintLineByLine(SkShaderUtils::PrettyPrint(sksl));
        }
        if (gPrintHLSL) {
            SkDebugf("HLSL:\n");
            SkShaderUtils::PrintLineByLine(SkShaderUtils::PrettyPrint(*outHLSL));
        }
    }

    if (program->fInputs.fUseFlipRTUniform) {
        this->addRTFlipUniform(SKSL_RTFLIP_NAME);
    }

    return GrCompileHLSLShader(fGpu, *outHLSL, kind);
}

static DXGI_FORMAT attrib_type_to_format(GrVertexAttribType type) {
    switch (type) {
    case kFloat_GrVertexAttribType:
        return DXGI_FORMAT_R32_FLOAT;
    case kFloat2_GrVertexAttribType:
        return DXGI_FORMAT_R32G32_FLOAT;
    case kFloat3_GrVertexAttribType:
        return DXGI_FORMAT_R32G32B32_FLOAT;
    case kFloat4_GrVertexAttribType:
        return DXGI_FORMAT_R32G32B32A32_FLOAT;
    case kHalf_GrVertexAttribType:
        return DXGI_FORMAT_R16_FLOAT;
    case kHalf2_GrVertexAttribType:
        return DXGI_FORMAT_R16G16_FLOAT;
    case kHalf4_GrVertexAttribType:
        return DXGI_FORMAT_R16G16B16A16_FLOAT;
    case kInt2_GrVertexAttribType:
        return DXGI_FORMAT_R32G32_SINT;
    case kInt3_GrVertexAttribType:
        return DXGI_FORMAT_R32G32B32_SINT;
    case kInt4_GrVertexAttribType:
        return DXGI_FORMAT_R32G32B32A32_SINT;
    case kByte_GrVertexAttribType:
        return DXGI_FORMAT_R8_SINT;
    case kByte2_GrVertexAttribType:
        return DXGI_FORMAT_R8G8_SINT;
    case kByte4_GrVertexAttribType:
        return DXGI_FORMAT_R8G8B8A8_SINT;
    case kUByte_GrVertexAttribType:
        return DXGI_FORMAT_R8_UINT;
    case kUByte2_GrVertexAttribType:
        return DXGI_FORMAT_R8G8_UINT;
    case kUByte4_GrVertexAttribType:
        return DXGI_FORMAT_R8G8B8A8_UINT;
    case kUByte_norm_GrVertexAttribType:
        return DXGI_FORMAT_R8_UNORM;
    case kUByte4_norm_GrVertexAttribType:
        return DXGI_FORMAT_R8G8B8A8_UNORM;
    case kShort2_GrVertexAttribType:
        return DXGI_FORMAT_R16G16_SINT;
    case kShort4_GrVertexAttribType:
        return DXGI_FORMAT_R16G16B16A16_SINT;
    case kUShort2_GrVertexAttribType:
        return DXGI_FORMAT_R16G16_UINT;
    case kUShort2_norm_GrVertexAttribType:
        return DXGI_FORMAT_R16G16_UNORM;
    case kInt_GrVertexAttribType:
        return DXGI_FORMAT_R32_SINT;
    case kUInt_GrVertexAttribType:
        return DXGI_FORMAT_R32_UINT;
    case kUShort_norm_GrVertexAttribType:
        return DXGI_FORMAT_R16_UNORM;
    case kUShort4_norm_GrVertexAttribType:
        return DXGI_FORMAT_R16G16B16A16_UNORM;
    }
    SK_ABORT("Unknown vertex attrib type");
}

static void setup_vertex_input_layout(const GrGeometryProcessor& geomProc,
                                      D3D11_INPUT_ELEMENT_DESC* inputElements) {
    unsigned int slotNumber = 0;
    unsigned int vertexSlot = 0;
    unsigned int instanceSlot = 0;
    if (geomProc.hasVertexAttributes()) {
        vertexSlot = slotNumber++;
    }
    if (geomProc.hasInstanceAttributes()) {
        instanceSlot = slotNumber++;
    }

    unsigned int currentAttrib = 0;

    for (const auto& attrib : geomProc.vertexAttributes()) {
        // When using SPIRV-Cross it converts the location modifier in SPIRV to be
        // TEXCOORD<N> where N is the location value for eveery vertext attribute
        inputElements[currentAttrib] = { "TEXCOORD", currentAttrib,
                                        attrib_type_to_format(attrib.cpuType()),
                                        vertexSlot, SkToU32(*attrib.offset()),
                                        D3D11_INPUT_PER_VERTEX_DATA,
                                        0};
        currentAttrib++;
    }

    for (const auto& attrib : geomProc.instanceAttributes()) {
        // When using SPIRV-Cross it converts the location modifier in SPIRV to be
        // TEXCOORD<N> where N is the location value for eveery vertext attribute
        inputElements[currentAttrib] = { "TEXCOORD", currentAttrib,
                                        attrib_type_to_format(attrib.cpuType()),
                                        instanceSlot, SkToU32(*attrib.offset()),
                                        D3D11_INPUT_PER_INSTANCE_DATA,
                                        1};
        currentAttrib++;
    }
}

static D3D11_BLEND blend_coeff_to_d3d11_blend(skgpu::BlendCoeff coeff) {
    switch (coeff) {
    case skgpu::BlendCoeff::kZero:
        return D3D11_BLEND_ZERO;
    case skgpu::BlendCoeff::kOne:
        return D3D11_BLEND_ONE;
    case skgpu::BlendCoeff::kSC:
        return D3D11_BLEND_SRC_COLOR;
    case skgpu::BlendCoeff::kISC:
        return D3D11_BLEND_INV_SRC_COLOR;
    case skgpu::BlendCoeff::kDC:
        return D3D11_BLEND_DEST_COLOR;
    case skgpu::BlendCoeff::kIDC:
        return D3D11_BLEND_INV_DEST_COLOR;
    case skgpu::BlendCoeff::kSA:
        return D3D11_BLEND_SRC_ALPHA;
    case skgpu::BlendCoeff::kISA:
        return D3D11_BLEND_INV_SRC_ALPHA;
    case skgpu::BlendCoeff::kDA:
        return D3D11_BLEND_DEST_ALPHA;
    case skgpu::BlendCoeff::kIDA:
        return D3D11_BLEND_INV_DEST_ALPHA;
    case skgpu::BlendCoeff::kConstC:
        return D3D11_BLEND_BLEND_FACTOR;
    case skgpu::BlendCoeff::kIConstC:
        return D3D11_BLEND_INV_BLEND_FACTOR;
    case skgpu::BlendCoeff::kS2C:
        return D3D11_BLEND_SRC1_COLOR;
    case skgpu::BlendCoeff::kIS2C:
        return D3D11_BLEND_INV_SRC1_COLOR;
    case skgpu::BlendCoeff::kS2A:
        return D3D11_BLEND_SRC1_ALPHA;
    case skgpu::BlendCoeff::kIS2A:
        return D3D11_BLEND_INV_SRC1_ALPHA;
    case skgpu::BlendCoeff::kIllegal:
        return D3D11_BLEND_ZERO;
    }
    SkUNREACHABLE;
}

static D3D11_BLEND blend_coeff_to_d3d11_blend_for_alpha(skgpu::BlendCoeff coeff) {
    switch (coeff) {
        // Force all srcColor used in alpha slot to alpha version.
    case skgpu::BlendCoeff::kSC:
        return D3D11_BLEND_SRC_ALPHA;
    case skgpu::BlendCoeff::kISC:
        return D3D11_BLEND_INV_SRC_ALPHA;
    case skgpu::BlendCoeff::kDC:
        return D3D11_BLEND_DEST_ALPHA;
    case skgpu::BlendCoeff::kIDC:
        return D3D11_BLEND_INV_DEST_ALPHA;
    case skgpu::BlendCoeff::kS2C:
        return D3D11_BLEND_SRC1_ALPHA;
    case skgpu::BlendCoeff::kIS2C:
        return D3D11_BLEND_INV_SRC1_ALPHA;

    default:
        return blend_coeff_to_d3d11_blend(coeff);
    }
}


static D3D11_BLEND_OP blend_equation_to_d3d11_op(skgpu::BlendEquation equation) {
    switch (equation) {
    case skgpu::BlendEquation::kAdd:
        return D3D11_BLEND_OP_ADD;
    case skgpu::BlendEquation::kSubtract:
        return D3D11_BLEND_OP_SUBTRACT;
    case skgpu::BlendEquation::kReverseSubtract:
        return D3D11_BLEND_OP_REV_SUBTRACT;
    default:
        SkUNREACHABLE;
    }
}

static void fill_in_blend_state(const GrPipeline& pipeline, D3D11_BLEND_DESC* blendDesc) {
    blendDesc->AlphaToCoverageEnable = false;
    blendDesc->IndependentBlendEnable = false;

    const skgpu::BlendInfo& blendInfo = pipeline.getXferProcessor().getBlendInfo();

    skgpu::BlendEquation equation = blendInfo.fEquation;
    skgpu::BlendCoeff srcCoeff = blendInfo.fSrcBlend;
    skgpu::BlendCoeff dstCoeff = blendInfo.fDstBlend;
    bool blendOff = skgpu::BlendShouldDisable(equation, srcCoeff, dstCoeff);

    auto& rtBlend = blendDesc->RenderTarget[0];
    rtBlend.BlendEnable = !blendOff;
    if (!blendOff) {
        rtBlend.SrcBlend = blend_coeff_to_d3d11_blend(srcCoeff);
        rtBlend.DestBlend = blend_coeff_to_d3d11_blend(dstCoeff);
        rtBlend.BlendOp = blend_equation_to_d3d11_op(equation);
        rtBlend.SrcBlendAlpha = blend_coeff_to_d3d11_blend_for_alpha(srcCoeff);
        rtBlend.DestBlendAlpha = blend_coeff_to_d3d11_blend_for_alpha(dstCoeff);
        rtBlend.BlendOpAlpha = blend_equation_to_d3d11_op(equation);
    }

    if (!blendInfo.fWritesColor) {
        rtBlend.RenderTargetWriteMask = 0;
    } else {
        rtBlend.RenderTargetWriteMask = D3D11_COLOR_WRITE_ENABLE_ALL;
    }
}

static void fill_in_rasterizer_state(const GrPipeline& pipeline,
                                     bool multisampleEnable,
                                     const GrCaps* caps,
                                     D3D11_RASTERIZER_DESC* rasterizer) {
    rasterizer->FillMode = (caps->wireframeMode() || pipeline.isWireframe()) ?
        D3D11_FILL_WIREFRAME : D3D11_FILL_SOLID;
    rasterizer->CullMode = D3D11_CULL_NONE;
    rasterizer->FrontCounterClockwise = true;
    rasterizer->DepthBias = 0;
    rasterizer->DepthBiasClamp = 0.0f;
    rasterizer->SlopeScaledDepthBias = 0.0f;
    rasterizer->DepthClipEnable = false;
    rasterizer->ScissorEnable = true;
    rasterizer->MultisampleEnable = multisampleEnable;
    rasterizer->AntialiasedLineEnable = false;
}

static D3D11_STENCIL_OP stencil_op_to_d3d11_op(GrStencilOp op) {
    switch (op) {
    case GrStencilOp::kKeep:
        return D3D11_STENCIL_OP_KEEP;
    case GrStencilOp::kZero:
        return D3D11_STENCIL_OP_ZERO;
    case GrStencilOp::kReplace:
        return D3D11_STENCIL_OP_REPLACE;
    case GrStencilOp::kInvert:
        return D3D11_STENCIL_OP_INVERT;
    case GrStencilOp::kIncWrap:
        return D3D11_STENCIL_OP_INCR;
    case GrStencilOp::kDecWrap:
        return D3D11_STENCIL_OP_DECR;
    case GrStencilOp::kIncClamp:
        return D3D11_STENCIL_OP_INCR_SAT;
    case GrStencilOp::kDecClamp:
        return D3D11_STENCIL_OP_DECR_SAT;
    }
    SkUNREACHABLE;
}

static D3D11_COMPARISON_FUNC stencil_test_to_d3d11_func(GrStencilTest test) {
    switch (test) {
    case GrStencilTest::kAlways:
        return D3D11_COMPARISON_ALWAYS;
    case GrStencilTest::kNever:
        return D3D11_COMPARISON_NEVER;
    case GrStencilTest::kGreater:
        return D3D11_COMPARISON_GREATER;
    case GrStencilTest::kGEqual:
        return D3D11_COMPARISON_GREATER_EQUAL;
    case GrStencilTest::kLess:
        return D3D11_COMPARISON_LESS;
    case GrStencilTest::kLEqual:
        return D3D11_COMPARISON_LESS_EQUAL;
    case GrStencilTest::kEqual:
        return D3D11_COMPARISON_EQUAL;
    case GrStencilTest::kNotEqual:
        return D3D11_COMPARISON_NOT_EQUAL;
    }
    SkUNREACHABLE;
}

static void setup_stencilop_desc(D3D11_DEPTH_STENCILOP_DESC* desc,
                                 const GrStencilSettings::Face& stencilFace) {
    desc->StencilFailOp = stencil_op_to_d3d11_op(stencilFace.fFailOp);
    desc->StencilDepthFailOp = desc->StencilFailOp;
    desc->StencilPassOp = stencil_op_to_d3d11_op(stencilFace.fPassOp);
    desc->StencilFunc = stencil_test_to_d3d11_func(stencilFace.fTest);
}

static void fill_in_depth_stencil_state(const GrProgramInfo& programInfo,
                                        D3D11_DEPTH_STENCIL_DESC* dsDesc) {
    GrStencilSettings stencilSettings = programInfo.nonGLStencilSettings();
    GrSurfaceOrigin origin = programInfo.origin();

    dsDesc->DepthEnable = false;
    dsDesc->DepthWriteMask = D3D11_DEPTH_WRITE_MASK_ZERO;
    dsDesc->DepthFunc = D3D11_COMPARISON_NEVER;
    dsDesc->StencilEnable = !stencilSettings.isDisabled();
    if (!stencilSettings.isDisabled()) {
        if (stencilSettings.isTwoSided()) {
            const auto& frontFace = stencilSettings.postOriginCCWFace(origin);
            const auto& backFace = stencilSettings.postOriginCWFace(origin);

            SkASSERT(frontFace.fTestMask == backFace.fTestMask);
            SkASSERT(frontFace.fWriteMask == backFace.fWriteMask);
            dsDesc->StencilReadMask = frontFace.fTestMask;
            dsDesc->StencilWriteMask = frontFace.fWriteMask;

            setup_stencilop_desc(&dsDesc->FrontFace, frontFace);
            setup_stencilop_desc(&dsDesc->BackFace, backFace);
        } else {
            dsDesc->StencilReadMask = stencilSettings.singleSidedFace().fTestMask;
            dsDesc->StencilWriteMask = stencilSettings.singleSidedFace().fWriteMask;
            setup_stencilop_desc(&dsDesc->FrontFace, stencilSettings.singleSidedFace());
            dsDesc->BackFace = dsDesc->FrontFace;
        }
    }
}

static constexpr SkFourByteTag kHLSL_Tag = SkSetFourByteTag('H', 'L', 'S', 'L');
static constexpr SkFourByteTag kSKSL_Tag = SkSetFourByteTag('S', 'K', 'S', 'L');

std::unique_ptr<GrD3D11Program> GrD3D11ProgramBuilder::finalize() {
    TRACE_EVENT0("skia.shaders", TRACE_FUNC);

    this->finalizeShaders();

    SkSL::ProgramSettings settings;
    settings.fSharpenTextures = true;
    settings.fRTFlipOffset = fUniformHandler.getRTFlipOffset();
    settings.fRTFlipBinding = 0;
    settings.fRTFlipSet = 0;

    sk_sp<SkData> cached;
    SkReadBuffer reader;
    SkFourByteTag shaderType = 0;
    auto persistentCache = fGpu->getContext()->priv().getPersistentCache();
    if (persistentCache) {
        // Shear off the D3D-specific portion of the Desc to get the persistent key. We only cache
        // shader code, not entire pipelines.
        sk_sp<SkData> key =
                SkData::MakeWithoutCopy(this->desc().asKey(), this->desc().initialKeyLength());
        cached = persistentCache->load(*key);
        if (cached) {
            reader.setMemory(cached->data(), cached->size());
            shaderType = GrPersistentCacheUtils::GetType(&reader);
        }
    }

    const GrGeometryProcessor& geomProc = this->geometryProcessor();
    gr_cp<ID3DBlob> shaders[kGrShaderTypeCount];

    if (kHLSL_Tag == shaderType && this->loadHLSLFromCache(&reader, shaders)) {
        // We successfully loaded and compiled HLSL
    } else {
        SkSL::Program::Inputs inputs[kGrShaderTypeCount];
        std::string* sksl[kGrShaderTypeCount] = {
            &fVS.fCompilerString,
            &fFS.fCompilerString,
        };
        std::string cached_sksl[kGrShaderTypeCount];
        std::string hlsl[kGrShaderTypeCount];

        if (kSKSL_Tag == shaderType) {
            if (GrPersistentCacheUtils::UnpackCachedShaders(&reader, cached_sksl, inputs,
                                                            kGrShaderTypeCount)) {
                for (int i = 0; i < kGrShaderTypeCount; ++i) {
                    sksl[i] = &cached_sksl[i];
                }
            }
        }

        auto compile = [&](SkSL::ProgramKind kind, GrShaderType shaderType) {
            shaders[shaderType] = this->compileD3D11Program(kind, *sksl[shaderType], settings,
                                                          &inputs[shaderType], &hlsl[shaderType]);
            return shaders[shaderType].get();
        };

        if (!compile(SkSL::ProgramKind::kVertex, kVertex_GrShaderType) ||
            !compile(SkSL::ProgramKind::kFragment, kFragment_GrShaderType)) {
            return nullptr;
        }

        if (persistentCache && !cached) {
            const bool cacheSkSL = fGpu->getContext()->priv().options().fShaderCacheStrategy ==
                                   GrContextOptions::ShaderCacheStrategy::kSkSL;
            if (cacheSkSL) {
                // Replace the HLSL with formatted SkSL to be cached. This looks odd, but this is
                // the last time we're going to use these strings, so it's safe.
                for (int i = 0; i < kGrShaderTypeCount; ++i) {
                    hlsl[i] = SkShaderUtils::PrettyPrint(*sksl[i]);
                }
            }
            sk_sp<SkData> key =
                    SkData::MakeWithoutCopy(this->desc().asKey(), this->desc().initialKeyLength());
            SkString description = GrProgramDesc::Describe(fProgramInfo, *this->caps());
            sk_sp<SkData> data = GrPersistentCacheUtils::PackCachedShaders(
                    cacheSkSL ? kSKSL_Tag : kHLSL_Tag, hlsl, inputs, kGrShaderTypeCount);
            persistentCache->store(*key, *data, description);
        }
    }

    HRESULT hr;

    gr_cp<ID3D11VertexShader> vertexShader;
    gr_cp<ID3D11PixelShader> pixelShader;
    gr_cp<ID3D11InputLayout> inputLayout;

    hr = fGpu->device()->CreateVertexShader(shaders[kVertex_GrShaderType]->GetBufferPointer(),
                                       shaders[kVertex_GrShaderType]->GetBufferSize(),
                                       nullptr,
                                       &vertexShader);
    GR_D3D_CALL_ERRCHECK(hr);

    hr = fGpu->device()->CreatePixelShader(shaders[kFragment_GrShaderType]->GetBufferPointer(),
                                      shaders[kFragment_GrShaderType]->GetBufferSize(),
                                      nullptr,
                                      &pixelShader);
    GR_D3D_CALL_ERRCHECK(hr);

    unsigned int totalAttributeCnt = fProgramInfo.geomProc().numVertexAttributes() +
                                     fProgramInfo.geomProc().numInstanceAttributes();
    skia_private::AutoSTArray<4, D3D11_INPUT_ELEMENT_DESC> inputElements(totalAttributeCnt);
    setup_vertex_input_layout(fProgramInfo.geomProc(), inputElements.get());

    hr = fGpu->device()->CreateInputLayout(inputElements.data(),
                                      inputElements.size(),
                                      shaders[kVertex_GrShaderType]->GetBufferPointer(),
                                      shaders[kVertex_GrShaderType]->GetBufferSize(),
                                      &inputLayout);
    GR_D3D_CALL_ERRCHECK(hr);

    gr_cp<ID3D11BlendState> blendState;
    gr_cp<ID3D11RasterizerState> rasterizerState;
    gr_cp<ID3D11DepthStencilState> depthStencilState;

    D3D11_BLEND_DESC blendDesc;
    fill_in_blend_state(fProgramInfo.pipeline(), &blendDesc);
    hr = fGpu->device()->CreateBlendState(&blendDesc, &blendState);
    GR_D3D_CALL_ERRCHECK(hr);

    D3D11_RASTERIZER_DESC rasterizer;
    fill_in_rasterizer_state(
            fProgramInfo.pipeline(), fProgramInfo.numSamples() > 1, fGpu->caps(), &rasterizer);
    hr = fGpu->device()->CreateRasterizerState(&rasterizer, &rasterizerState);
    GR_D3D_CALL_ERRCHECK(hr);

    D3D11_DEPTH_STENCIL_DESC dsDesc;
    fill_in_depth_stencil_state(fProgramInfo, &dsDesc);
    hr = fGpu->device()->CreateDepthStencilState(&dsDesc, &depthStencilState);
    GR_D3D_CALL_ERRCHECK(hr);

    return std::unique_ptr<GrD3D11Program>(
            new GrD3D11Program(std::move(vertexShader),
                            std::move(pixelShader),
                            std::move(inputLayout),
                            std::move(blendState),
                            std::move(rasterizerState),
                            std::move(depthStencilState),
                            fUniformHandles,
                            fUniformHandler.fUniforms,
                            fUniformHandler.fCurrentUBOOffset,
                            fUniformHandler.fSamplers.count(),
                            std::move(fGPImpl),
                            std::move(fXPImpl),
                            std::move(fFPImpls),
                            geomProc.vertexStride(),
                            geomProc.instanceStride()));
}
