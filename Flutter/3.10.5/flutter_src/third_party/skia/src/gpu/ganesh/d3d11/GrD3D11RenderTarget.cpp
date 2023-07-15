
#include "src/gpu/ganesh/d3d11/GrD3D11RenderTarget.h"
#include "src/gpu/ganesh/d3d11/GrD3D11Attachment.h"
#include "src/gpu/KeyBuilder.h"

// We're virtually derived from GrSurface (via GrRenderTarget) so its
// constructor must be explicitly called.
GrD3D11RenderTarget::GrD3D11RenderTarget(GrD3D11Gpu* gpu,
                                     SkISize dimensions,
                                     const GrD3D11TextureInfo& info,
                                     ID3D11RenderTargetView* renderTargetView,
                                     Wrapped,
                                     std::string_view label)
        : GrSurface(gpu, dimensions, info.fProtected, label)
        , GrRenderTarget(gpu, dimensions, info.fSampleCount, info.fProtected, label)
        , fColorRenderTargetView(renderTargetView)
        , fInfo(info) {
    this->registerWithCacheWrapped(GrWrapCacheable::kNo);
}

// We're virtually derived from GrSurface (via GrRenderTarget) so its
// constructor must be explicitly called.
GrD3D11RenderTarget::GrD3D11RenderTarget(GrD3D11Gpu* gpu,
                                     SkISize dimensions,
                                     const GrD3D11TextureInfo& info,
                                     ID3D11RenderTargetView* renderTargetView,
                                     std::string_view label)
        : GrSurface(gpu, dimensions, info.fProtected, label)
        , GrRenderTarget(gpu, dimensions, info.fSampleCount, info.fProtected, label)
        , fColorRenderTargetView(renderTargetView) 
        , fInfo(info) {}

sk_sp<GrD3D11RenderTarget> GrD3D11RenderTarget::MakeWrappedRenderTarget(
        GrD3D11Gpu* gpu,
        SkISize dimensions,
        int sampleCnt,
        const GrD3D11TextureInfo& info) {
    SkASSERT(info.fTexture.get());
    SkASSERT(info.fLevelCount == 1);
    SkASSERT(sampleCnt >= 1 && info.fSampleCount >= 1);

    int wrappedTextureSampleCnt = static_cast<int>(info.fSampleCount);
    if (sampleCnt != wrappedTextureSampleCnt && wrappedTextureSampleCnt != 1) {
        return nullptr;
    }

    D3D11_RENDER_TARGET_VIEW_DESC viewDesc;
    viewDesc.Format = info.fFormat;
    viewDesc.ViewDimension = D3D11_RTV_DIMENSION_TEXTURE2D;
    viewDesc.Texture2D.MipSlice = 0;

    ID3D11RenderTargetView* renderTargetView = nullptr;
    auto hr = gpu->device()->CreateRenderTargetView(info.fTexture.get(), &viewDesc, &renderTargetView);
    GR_D3D_CALL_ERRCHECK(hr);

    // create msaa surface if necessary
    GrD3D11RenderTarget* d3d11RT;
    d3d11RT = new GrD3D11RenderTarget(gpu,
                                      dimensions,
                                      info,
                                      renderTargetView,
                                      kWrapped,
                                      /*label=*/"MakeWrappedRenderTarget");

    return sk_sp<GrD3D11RenderTarget>(d3d11RT);
}

GrD3D11RenderTarget::~GrD3D11RenderTarget() {
}

void GrD3D11RenderTarget::releaseInternalObjects() {
    GrSafeComRelease(fColorRenderTargetView);
}

void GrD3D11RenderTarget::onRelease() {
    this->releaseInternalObjects();
    fInfo.fTexture.reset();
    GrRenderTarget::onRelease();
}

void GrD3D11RenderTarget::onAbandon() {
    this->releaseInternalObjects();
    fInfo.fTexture.reset();
    GrRenderTarget::onAbandon();
}

GrBackendRenderTarget GrD3D11RenderTarget::getBackendRenderTarget() const {
    sk_sp<GrD3DResourceState> state;
    return GrBackendRenderTarget(this->width(), this->height(), fInfo.toD3D12Info(), state);
}

GrD3D11Gpu* GrD3D11RenderTarget::getD3D11Gpu() const {
    SkASSERT(!this->wasDestroyed());
    return static_cast<GrD3D11Gpu*>(this->getGpu());
}

DXGI_FORMAT GrD3D11RenderTarget::stencilDxgiFormat() const {
    if (auto stencil = this->getStencilAttachment()) {
        auto d3dStencil = static_cast<GrD3D11Attachment*>(stencil);
        return d3dStencil->dxgiFormat();
    }
    return DXGI_FORMAT_UNKNOWN;
}

void GrD3D11RenderTarget::genKey(skgpu::KeyBuilder* b) const {
    b->add32(fInfo.fFormat);
    b->add32(this->numSamples());
    b->add32(this->stencilDxgiFormat());
#ifdef SK_DEBUG
    if (const GrAttachment* stencil = this->getStencilAttachment()) {
        SkASSERT(stencil->numSamples() == this->numSamples());
    }
#endif
    b->add32(DXGI_STANDARD_MULTISAMPLE_QUALITY_PATTERN /*this->sampleQualityPattern()*/);
}

void GrD3D11RenderTarget::onSetLabel() {
    SkASSERT(this->d3d11Resource());
    if (!this->getLabel().empty()) {
        const std::string label = "_Skia_" + this->getLabel();
        this->d3d11Resource()->SetPrivateData(
                WKPDID_D3DDebugObjectName, label.size(), label.c_str());
    }
}
