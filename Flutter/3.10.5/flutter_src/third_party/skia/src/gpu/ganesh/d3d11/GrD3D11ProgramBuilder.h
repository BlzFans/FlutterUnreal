/*
 * Copyright 2020 Google LLC
 *
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */

#ifndef GrD3DPipelineStateBuilder_DEFINED
#define GrD3DPipelineStateBuilder_DEFINED

#include "src/gpu/ganesh/GrPipeline.h"
#include "src/gpu/ganesh/GrSPIRVUniformHandler.h"
#include "src/gpu/ganesh/GrSPIRVVaryingHandler.h"
#include "src/gpu/ganesh/glsl/GrGLSLProgramBuilder.h"
#include "src/sksl/ir/SkSLProgram.h"

#include "include/gpu/d3d11/GrD3D11Types.h"
#include "src/gpu/ganesh/d3d11/GrD3D11UniformDataManager.h"

class GrProgramDesc;
class GrD3D11Gpu;
class GrVkRenderPass;
class GrD3D11RenderTarget;

struct GrD3D11Program : public SkRefCnt {
    typedef GrSPIRVUniformHandler::UniformInfoArray UniformInfoArray;

    GrD3D11Program(gr_cp<ID3D11VertexShader> vertexShader,
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
                   size_t instanceStride);

    // We can only cache non dirty uniform values until we submit a command list. After that, the
    // next frame will get a completely different uniform buffer and/or offset into the buffer. Thus
    // we need a way to mark them all as dirty during submit.
    void markUniformsDirty() { fDataManager.markDirty(); }

    void setAndBindConstants(GrD3D11Gpu*, const GrRenderTarget*, const GrProgramInfo&);

    void setAndBindTextures(GrD3D11Gpu*,
                            const GrGeometryProcessor&,
                            const GrSurfaceProxy* const geomProcTextures[],
                            const GrPipeline&);

    void setBlendState(GrD3D11Gpu* gpu, const GrProgramInfo& programInfo);
    void setDepthStencilState(GrD3D11Gpu* gpu, const GrProgramInfo& programInfo);
    void setRasterizerState(GrD3D11Gpu* gpu, const GrProgramInfo& programInfo);

    /**
     * We use the RT's size and origin to adjust from Skia device space to d3d normalized device
     * space and to make device space positions have the correct origin for processors that require
     * them.
     */
    struct RenderTargetState {
        SkISize fRenderTargetSize;
        GrSurfaceOrigin fRenderTargetOrigin;

        RenderTargetState() { this->invalidate(); }
        void invalidate() {
            fRenderTargetSize.fWidth = -1;
            fRenderTargetSize.fHeight = -1;
            fRenderTargetOrigin = (GrSurfaceOrigin)-1;
        }
    };

    // Helper for setData() that sets the view matrix and loads the render target height uniform
    void setRenderTargetState(const GrRenderTarget*, GrSurfaceOrigin);

    unsigned int fNumSamplers;
    size_t fVertexStride;
    size_t fInstanceStride;

    // Tracks the current render target uniforms stored in the vertex buffer.
    RenderTargetState fRenderTargetState;
    GrGLSLBuiltinUniformHandles fBuiltinUniformHandles;

    GrD3D11UniformDataManager fDataManager;

    // Processors in the GrD3DPipelineState
    std::unique_ptr<GrGeometryProcessor::ProgramImpl> fGPImpl;
    std::unique_ptr<GrXferProcessor::ProgramImpl> fXPImpl;
    std::vector<std::unique_ptr<GrFragmentProcessor::ProgramImpl>> fFPImpls;

    gr_cp<ID3D11VertexShader> fVertexShader;
    gr_cp<ID3D11PixelShader> fPixelShader;
    gr_cp<ID3D11InputLayout> fInputLayout;
    gr_cp<ID3D11BlendState> fBlendState;
    gr_cp<ID3D11RasterizerState> fRasterizerState;
    gr_cp<ID3D11DepthStencilState> fDepthStencilState;
};

class GrD3D11ProgramBuilder : public GrGLSLProgramBuilder {
public:
    static std::unique_ptr<GrD3D11Program> MakeD3D11Program(GrD3D11Gpu*,
                                                                const GrProgramDesc&,
                                                                const GrProgramInfo&);


    const GrCaps* caps() const override;

    GrD3D11Gpu* gpu() const { return fGpu; }

    SkSL::Compiler* shaderCompiler() const override;

    void finalizeFragmentSecondaryColor(GrShaderVar& outputColor) override;

private:
    GrD3D11ProgramBuilder(GrD3D11Gpu*,
                          const GrProgramDesc&,
                              const GrProgramInfo&);

    std::unique_ptr<GrD3D11Program> finalize();

    bool loadHLSLFromCache(SkReadBuffer* reader, gr_cp<ID3DBlob> shaders[]);

    gr_cp<ID3DBlob> compileD3D11Program(SkSL::ProgramKind kind,
                                      const std::string& sksl,
                                      const SkSL::ProgramSettings& settings,
                                      SkSL::Program::Inputs* outInputs,
                                      std::string* outHLSL);

    GrGLSLUniformHandler* uniformHandler() override { return &fUniformHandler; }
    const GrGLSLUniformHandler* uniformHandler() const override { return &fUniformHandler; }
    GrGLSLVaryingHandler* varyingHandler() override { return &fVaryingHandler; }

    GrD3D11Gpu* fGpu;
    GrSPIRVVaryingHandler fVaryingHandler;
    GrSPIRVUniformHandler fUniformHandler;

    using INHERITED = GrGLSLProgramBuilder;
};

#endif
