
#include "src/gpu/ganesh/d3d11/GrD3D11Texture.h"

GrD3D11Texture::GrD3D11Texture(GrD3D11Gpu* gpu,
                           skgpu::Budgeted budgeted,
                           SkISize dimensions,
                           const GrD3D11TextureInfo& info,
                           ID3D11ShaderResourceView* shaderResourceView,
                           GrMipmapStatus mipmapStatus,
                           std::string_view label)
        : GrSurface(gpu, dimensions, info.fProtected, label)
        , INHERITED(gpu, dimensions, info.fProtected, GrTextureType::k2D, mipmapStatus, label)
        , fShaderResourceView(shaderResourceView) 
        , fInfo(info) {
    SkASSERT((GrMipmapStatus::kNotAllocated == mipmapStatus) == (1 == info.fLevelCount));
    this->registerWithCache(budgeted);
    if (GrDxgiFormatIsCompressed(info.fFormat)) {
        this->setReadOnly();
    }
}

GrD3D11Texture::GrD3D11Texture(GrD3D11Gpu* gpu,
                           SkISize dimensions,
                           const GrD3D11TextureInfo& info,
                           ID3D11ShaderResourceView* shaderResourceView,
                           GrMipmapStatus mipmapStatus,
                           GrWrapCacheable cacheable,
                           GrIOType ioType,
                           std::string_view label)
        : GrSurface(gpu, dimensions, info.fProtected, label)
        , INHERITED(gpu, dimensions, info.fProtected, GrTextureType::k2D, mipmapStatus, label)
        , fShaderResourceView(shaderResourceView)
        , fInfo(info) {
    SkASSERT((GrMipmapStatus::kNotAllocated == mipmapStatus) == (1 == info.fLevelCount));
    if (ioType == kRead_GrIOType) {
        this->setReadOnly();
    }
    this->registerWithCacheWrapped(cacheable);
}

GrD3D11Texture::GrD3D11Texture(GrD3D11Gpu* gpu,
                           SkISize dimensions,
                           const GrD3D11TextureInfo& info,
                           ID3D11ShaderResourceView* shaderResourceView,
                           GrMipmapStatus mipmapStatus,
                           std::string_view label)
        : GrSurface(gpu, dimensions, info.fProtected, label)
        , INHERITED(gpu, dimensions, info.fProtected, GrTextureType::k2D, mipmapStatus, label)
        , fShaderResourceView(shaderResourceView) 
        , fInfo(info) {
    SkASSERT((GrMipmapStatus::kNotAllocated == mipmapStatus) == (1 == info.fLevelCount));
}

sk_sp<GrD3D11Texture> GrD3D11Texture::MakeNewTexture(GrD3D11Gpu* gpu,
                                                 skgpu::Budgeted budgeted,
                                                 SkISize dimensions,
                                                 const D3D11_TEXTURE2D_DESC& desc,
                                                 GrProtected isProtected,
                                                 GrMipmapStatus mipmapStatus,
                                                 std::string_view label) {

    GrD3D11TextureInfo info;
    info.fFormat = desc.Format;
    info.fLevelCount = desc.MipLevels;
    info.fProtected = isProtected;
    info.fSampleCount = desc.SampleDesc.Count;

    HRESULT hr = gpu->device()->CreateTexture2D(&desc, nullptr, &info.fTexture);
    GR_D3D_CALL_ERRCHECK(hr);

    D3D11_SHADER_RESOURCE_VIEW_DESC viewDesc;
    viewDesc.Format = desc.Format;
    viewDesc.ViewDimension = D3D11_SRV_DIMENSION_TEXTURE2D;
    viewDesc.Texture2D.MipLevels = -1;
    viewDesc.Texture2D.MostDetailedMip = 0;

    ID3D11ShaderResourceView* shaderResourceView = nullptr;
    hr = gpu->device()->CreateShaderResourceView(
            info.fTexture.get(), &viewDesc, &shaderResourceView);
    GR_D3D_CALL_ERRCHECK(hr);

    GrD3D11Texture* tex = new GrD3D11Texture(gpu,
                                         budgeted,
                                         dimensions,
                                         info,
                                         shaderResourceView,
                                         mipmapStatus,
                                         label);

    return sk_sp<GrD3D11Texture>(tex);
}

sk_sp<GrD3D11Texture> GrD3D11Texture::MakeWrappedTexture(GrD3D11Gpu* gpu,
                                                     SkISize dimensions,
                                                     GrWrapCacheable cacheable,
                                                     GrIOType ioType,
                                                     const GrD3D11TextureInfo& info) {
    GrMipmapStatus mipmapStatus =
            info.fLevelCount > 1 ? GrMipmapStatus::kValid : GrMipmapStatus::kNotAllocated;

    D3D11_SHADER_RESOURCE_VIEW_DESC viewDesc;
    viewDesc.Format = info.fFormat;
    viewDesc.ViewDimension = D3D11_SRV_DIMENSION_TEXTURE2D;
    viewDesc.Texture2D.MipLevels = -1;
    viewDesc.Texture2D.MostDetailedMip = 0;

    ID3D11ShaderResourceView* shaderResourceView = nullptr;
    auto hr = gpu->device()->CreateShaderResourceView(
            info.fTexture.get(), &viewDesc, &shaderResourceView);
    GR_D3D_CALL_ERRCHECK(hr);

    return sk_sp<GrD3D11Texture>(new GrD3D11Texture(gpu,
                                                dimensions,
                                                info,
                                                shaderResourceView,
                                                mipmapStatus,
                                                cacheable,
                                                ioType,
                                                /*label=*/"D3DWrappedTexture"));
}

void GrD3D11Texture::onRelease() {
    GrD3D11Gpu* gpu = this->getD3D11Gpu();
    GrSafeComRelease(fShaderResourceView);
    this->releaseResource(gpu);

    INHERITED::onRelease();
}

void GrD3D11Texture::onAbandon() {
    GrD3D11Gpu* gpu = this->getD3D11Gpu();
    GrSafeComRelease(fShaderResourceView);
    this->releaseResource(gpu);

    INHERITED::onAbandon();
}

void GrD3D11Texture::releaseResource(GrD3D11Gpu* gpu) {
    fInfo.fTexture.reset();
}

GrBackendTexture GrD3D11Texture::getBackendTexture() const {
    sk_sp<GrD3DResourceState> state;
    return GrBackendTexture(this->width(), this->height(), fInfo.toD3D12Info(), state);
}

GrD3D11Gpu* GrD3D11Texture::getD3D11Gpu() const {
    SkASSERT(!this->wasDestroyed());
    return static_cast<GrD3D11Gpu*>(this->getGpu());
}

void GrD3D11Texture::onSetLabel() {
    SkASSERT(this->d3d11Resource());
    if (!this->getLabel().empty()) {
        const std::string label = "_Skia_" + this->getLabel();
        this->d3d11Resource()->SetPrivateData(
                WKPDID_D3DDebugObjectName, label.size(), label.c_str());
    }
}
