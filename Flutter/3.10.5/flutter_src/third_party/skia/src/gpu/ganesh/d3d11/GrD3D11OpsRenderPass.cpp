
#include "src/gpu/ganesh/d3d11/GrD3D11OpsRenderPass.h"
#include "src/gpu/ganesh/d3d11/GrD3D11Texture.h"
#include "src/gpu/ganesh/d3d11/GrD3D11RenderTarget.h"
#include "src/gpu/ganesh/d3d11/GrD3D11TextureRenderTarget.h"
#include "src/gpu/ganesh/d3d11/GrD3D11Attachment.h"
#include "src/gpu/ganesh/d3d11/GrD3D11Buffer.h"
#include "src/gpu/ganesh/d3d11/GrD3D11ProgramBuilder.h"
#include "src/gpu/ganesh/GrProgramDesc.h"
#include "src/gpu/ganesh/GrProgramInfo.h"
#include "src/gpu/ganesh/GrStencilSettings.h"
#include "src/gpu/ganesh/GrOpFlushState.h"

#ifdef SK_DEBUG
#include "include/gpu/GrDirectContext.h"
#include "src/gpu/ganesh/GrDirectContextPriv.h"
#endif

GrD3D11OpsRenderPass::GrD3D11OpsRenderPass(GrD3D11Gpu* gpu) 
	: fGpu(gpu) 
{}

bool GrD3D11OpsRenderPass::set(GrRenderTarget* rt,
                             GrSurfaceOrigin origin,
                             const SkIRect& bounds,
                             const GrOpsRenderPass::LoadAndStoreInfo& colorInfo,
                             const GrOpsRenderPass::StencilLoadAndStoreInfo& stencilInfo,
                             const skia_private::TArray<GrSurfaceProxy*, true>& sampledProxies) {
    SkASSERT(!fRenderTarget);
    SkASSERT(fGpu == rt->getContext()->priv().getGpu());

    this->INHERITED::set(rt, origin);

    fBounds = bounds;

    fColorLoadOp = colorInfo.fLoadOp;
    fClearColor = colorInfo.fClearColor;
    fStencilLoadOp = stencilInfo.fLoadOp;

    // TODO

    return true;
}

GrD3D11OpsRenderPass::~GrD3D11OpsRenderPass() {}

GrGpu* GrD3D11OpsRenderPass::gpu() { return fGpu; }

void GrD3D11OpsRenderPass::onBegin() {
    GrD3D11RenderTarget* d3dRT = static_cast<GrD3D11RenderTarget*>(fRenderTarget);
    SkASSERT(d3dRT->numSamples() == 1);
    
    ID3D11RenderTargetView* colorView = d3dRT->colorRenderTargetView();
    auto stencil = d3dRT->getStencilAttachment();
    GrD3D11Attachment* d3d11Stencil = static_cast<GrD3D11Attachment*>(stencil);
    ID3D11DepthStencilView* pDepthStencilView = nullptr;

    if (d3d11Stencil) {
        pDepthStencilView = (ID3D11DepthStencilView*) d3d11Stencil->view();
    }

    //D3D11 WARNING: ID3D11DeviceContext::OMSetRenderTargets: Resource being set to OM RenderTarget slot 0 is still bound on input!
    ID3D11ShaderResourceView* const pSRV[1] = {nullptr};
    fGpu->deviceContext()->PSSetShaderResources(0, 1, pSRV);
    fGpu->deviceContext()->PSSetShaderResources(1, 1, pSRV);
    fGpu->deviceContext()->PSSetShaderResources(2, 1, pSRV);
    fGpu->deviceContext()->PSSetShaderResources(3, 1, pSRV);

    fGpu->deviceContext()->OMSetRenderTargets(1, &colorView, pDepthStencilView);

    if (GrLoadOp::kClear == fColorLoadOp) {
        fGpu->deviceContext()->ClearRenderTargetView(colorView, fClearColor.data());
    }

    if (pDepthStencilView) {
        if (fStencilLoadOp == GrLoadOp::kClear) {
            fGpu->deviceContext()->ClearDepthStencilView(
                    pDepthStencilView, D3D11_CLEAR_STENCIL, 0, 0);
        }
    }
}

static void set_primitive_topology(GrD3D11Gpu* gpu, const GrProgramInfo& info) {
    D3D11_PRIMITIVE_TOPOLOGY topology = D3D_PRIMITIVE_TOPOLOGY_UNDEFINED;
    switch (info.primitiveType()) {
        case GrPrimitiveType::kTriangles:
            topology = D3D11_PRIMITIVE_TOPOLOGY_TRIANGLELIST;
            break;
        case GrPrimitiveType::kTriangleStrip:
            topology = D3D11_PRIMITIVE_TOPOLOGY_TRIANGLESTRIP;
            break;
        case GrPrimitiveType::kPoints:
            topology = D3D11_PRIMITIVE_TOPOLOGY_POINTLIST;
            break;
        case GrPrimitiveType::kLines:
            topology = D3D11_PRIMITIVE_TOPOLOGY_LINELIST;
            break;
        case GrPrimitiveType::kLineStrip:
            topology = D3D11_PRIMITIVE_TOPOLOGY_LINESTRIP;
            break;
        default:
            SkUNREACHABLE;
    }

    gpu->deviceContext()->IASetPrimitiveTopology(topology);
}

static void set_scissor_rects(GrD3D11Gpu* gpu,
                       const GrRenderTarget* renderTarget,
                       GrSurfaceOrigin rtOrigin,
                       const SkIRect& scissorRect) {
    SkASSERT(scissorRect.isEmpty() ||
             SkIRect::MakeWH(renderTarget->width(), renderTarget->height()).contains(scissorRect));

    D3D11_RECT scissor;
    scissor.left = scissorRect.fLeft;
    scissor.right = scissorRect.fRight;
    if (kTopLeft_GrSurfaceOrigin == rtOrigin) {
        scissor.top = scissorRect.fTop;
    } else {
        SkASSERT(kBottomLeft_GrSurfaceOrigin == rtOrigin);
        scissor.top = renderTarget->height() - scissorRect.fBottom;
    }
    scissor.bottom = scissor.top + scissorRect.height();

    SkASSERT(scissor.left >= 0);
    SkASSERT(scissor.top >= 0);
    gpu->deviceContext()->RSSetScissorRects(1, &scissor);
}

static void set_viewport(GrD3D11Gpu* gpu, const GrRenderTarget* renderTarget) {
    D3D11_VIEWPORT viewport;
    viewport.TopLeftX = 0.0f;
    viewport.TopLeftY = 0.0f;
    viewport.Width = SkIntToScalar(renderTarget->width());
    viewport.Height = SkIntToScalar(renderTarget->height());
    viewport.MinDepth = 0.0f;
    viewport.MaxDepth = 1.0f;
    gpu->deviceContext()->RSSetViewports(1, &viewport);
}

bool GrD3D11OpsRenderPass::onBindPipeline(const GrProgramInfo& info, const SkRect& drawBounds) {
    SkRect rtRect = SkRect::Make(fBounds);
    if (rtRect.intersect(drawBounds)) {
        rtRect.roundOut(&fCurrentPipelineBounds);
    } else {
        fCurrentPipelineBounds.setEmpty();
    }

    GrD3D11RenderTarget* d3d11RT = static_cast<GrD3D11RenderTarget*>(fRenderTarget);
    fCurrentProgram = fGpu->resourceProvider().findOrCreateProgram(d3d11RT, info);
    if (!fCurrentProgram) {
        return false;
    }
    fGpu->deviceContext()->IASetInputLayout(fCurrentProgram->fInputLayout.get());
    fGpu->deviceContext()->VSSetShader(fCurrentProgram->fVertexShader.get(), nullptr, 0);
    fGpu->deviceContext()->PSSetShader(fCurrentProgram->fPixelShader.get(), nullptr, 0);

    fCurrentProgram->setAndBindConstants(fGpu, fRenderTarget, info);
    fCurrentProgram->setBlendState(fGpu, info);
    fCurrentProgram->setDepthStencilState(fGpu, info);
    fCurrentProgram->setRasterizerState(fGpu, info);

    set_primitive_topology(fGpu, info);
    if (!info.pipeline().isScissorTestEnabled()) {
        // "Disable" scissor by setting it to the full pipeline bounds.
        set_scissor_rects(fGpu, fRenderTarget, fOrigin, fCurrentPipelineBounds);
    }
    set_viewport(fGpu, fRenderTarget);

    return true;
}

void GrD3D11OpsRenderPass::onSetScissorRect(const SkIRect& scissor) {
    SkIRect combinedScissorRect;
    if (!combinedScissorRect.intersect(fCurrentPipelineBounds, scissor)) {
        combinedScissorRect = SkIRect::MakeEmpty();
    }

    set_scissor_rects(fGpu, fRenderTarget, fOrigin, combinedScissorRect);
}

bool GrD3D11OpsRenderPass::onBindTextures(const GrGeometryProcessor& geomProc,
                                        const GrSurfaceProxy* const geomProcTextures[],
                                        const GrPipeline& pipeline) {
    SkASSERT(fCurrentProgram);

    fCurrentProgram->setAndBindTextures(fGpu, geomProc, geomProcTextures, pipeline);
    return true;
}

void GrD3D11OpsRenderPass::onBindBuffers(sk_sp<const GrBuffer> indexBuffer,
                                       sk_sp<const GrBuffer> instanceBuffer,
                                       sk_sp<const GrBuffer> vertexBuffer,
                                       GrPrimitiveRestart primRestart) {
    SkASSERT(GrPrimitiveRestart::kNo == primRestart);
    SkASSERT(fCurrentProgram);
    SkASSERT(!fGpu->caps()->usePrimitiveRestart());  // Ignore primitiveRestart parameter.

    //  Here our vertex and instance inputs need to match the same 0-based bindings they were
    // assigned in the PipelineState. That is, vertex first (if any) followed by instance.
    UINT numBuffers = 0;
    ID3D11Buffer* buffers[2];
    UINT strides[2];
    UINT offsets[2];

    if (vertexBuffer) {
        auto* d3dBuffer = static_cast<const GrD3D11Buffer*>(vertexBuffer.get());
        buffers[numBuffers] = d3dBuffer->d3d11Resource();
        strides[numBuffers] = fCurrentProgram->fVertexStride;
        offsets[numBuffers++] = 0;
    }

    if (instanceBuffer) {
        auto* d3dBuffer = static_cast<const GrD3D11Buffer*>(instanceBuffer.get());
        buffers[numBuffers] = d3dBuffer->d3d11Resource();
        strides[numBuffers] = fCurrentProgram->fInstanceStride;
        offsets[numBuffers++] = 0;
    }

    fGpu->deviceContext()->IASetVertexBuffers(0, numBuffers, buffers, strides, offsets);

    if (auto* d3dIndexBuffer = static_cast<const GrD3D11Buffer*>(indexBuffer.get())) {
        SkASSERT(!d3dIndexBuffer->isCpuBuffer());
        SkASSERT(!d3dIndexBuffer->isMapped());

        auto* d3dBuffer = static_cast<const GrD3D11Buffer*>(indexBuffer.get());
        fGpu->deviceContext()->IASetIndexBuffer(
                d3dBuffer->d3d11Resource(), DXGI_FORMAT_R16_UINT, 0);
    }

    fActiveInstanceBuffer = std::move(instanceBuffer);
    fActiveVertexBuffer = std::move(vertexBuffer);
    fActiveIndexBuffer = std::move(indexBuffer);
}

void GrD3D11OpsRenderPass::onDrawInstanced(int instanceCount,
                                         int baseInstance,
                                         int vertexCount,
                                         int baseVertex) {
    fGpu->deviceContext()->DrawInstanced(vertexCount, instanceCount, baseVertex, baseInstance);
    fGpu->stats()->incNumDraws();
}

void GrD3D11OpsRenderPass::onDrawIndexedInstanced(
        int indexCount, int baseIndex, int instanceCount, int baseInstance, int baseVertex) {
    fGpu->deviceContext()->DrawIndexedInstanced(
            indexCount, instanceCount, baseIndex, baseVertex, baseInstance);
    fGpu->stats()->incNumDraws();
}

void GrD3D11OpsRenderPass::onClear(const GrScissorState& scissor, std::array<float, 4> color) {
    SkASSERT(!scissor.enabled() || fGpu->caps()->performPartialClearsAsDraws());

    auto d3dRT = static_cast<GrD3D11RenderTarget*>(fRenderTarget);
    fGpu->deviceContext()->ClearRenderTargetView(d3dRT->colorRenderTargetView(), color.data());
}

void GrD3D11OpsRenderPass::onClearStencilClip(const GrScissorState& scissor, bool insideStencilMask) {
    SkASSERT(!scissor.enabled() || fGpu->caps()->performPartialClearsAsDraws());

    GrAttachment* sb = fRenderTarget->getStencilAttachment();
    // this should only be called internally when we know we have a
    // stencil buffer.
    SkASSERT(sb);
    int stencilBitCount = GrBackendFormatStencilBits(sb->backendFormat());

    // The contract with the callers does not guarantee that we preserve all bits in the stencil
    // during this clear. Thus we will clear the entire stencil to the desired value.

    uint8_t stencilColor = 0;
    if (insideStencilMask) {
        stencilColor = (1 << (stencilBitCount - 1));
    }

    auto d3dStencil = static_cast<GrD3D11Attachment*>(sb);
    fGpu->deviceContext()->ClearDepthStencilView((ID3D11DepthStencilView*)d3dStencil->view(),
                                                 D3D11_CLEAR_STENCIL, 0, stencilColor);
}

void GrD3D11OpsRenderPass::inlineUpload(GrOpFlushState* state, GrDeferredTextureUploadFn& upload) {
    // If we ever start using copy command lists for doing uploads, then we'll need to make sure
    // we submit our main command list before doing the copy here and then start a new main command
    // list.
    fGpu->endRenderPass(fRenderTarget, fOrigin, fBounds);

    // We pass in true here to signal that after the upload we need to set the upload texture's
    // resource state back to D3D12_RESOURCE_STATE_PIXEL_SHADER_RESOURCE.
    state->doUpload(upload, true);
}

void GrD3D11OpsRenderPass::submit() {
    if (!fRenderTarget) {
        return;
    }
    // We don't use render passes in d3d, so there is nothing to submit here as all commands have
    // already been recorded on the main command list. If in the future we start to use render
    // passes on d3d12 devices that support them (most likely ARM devices), then we
    // will submit them here.
    fGpu->endRenderPass(fRenderTarget, fOrigin, fBounds);
}
