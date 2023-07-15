
#include "src/gpu/ganesh/d3d11/GrD3D11TextureRenderTarget.h"
#include "src/gpu/ganesh/d3d11/GrD3D11Gpu.h"

GrD3D11TextureRenderTarget::GrD3D11TextureRenderTarget(
        GrD3D11Gpu* gpu,
        skgpu::Budgeted budgeted,
        SkISize dimensions,
        const GrD3D11TextureInfo& info,
        ID3D11ShaderResourceView* shaderResourceView,
        ID3D11RenderTargetView* renderTargetView,
        GrMipmapStatus mipmapStatus,
        std::string_view label)
        : GrSurface(gpu, dimensions, info.fProtected, label)
        , GrD3D11Texture(gpu, dimensions, info, shaderResourceView, mipmapStatus, label)
        , GrD3D11RenderTarget(gpu, dimensions, info, renderTargetView, label) {
    this->registerWithCache(budgeted);
}

GrD3D11TextureRenderTarget::GrD3D11TextureRenderTarget(
        GrD3D11Gpu* gpu,
        SkISize dimensions,
        const GrD3D11TextureInfo& info,
        ID3D11ShaderResourceView* shaderResourceView,
        ID3D11RenderTargetView* renderTargetView,
        GrMipmapStatus mipmapStatus,
        GrWrapCacheable cacheable,
        std::string_view label)
        : GrSurface(gpu, dimensions, info.fProtected, label)
        , GrD3D11Texture(gpu, dimensions, info, shaderResourceView, mipmapStatus, label)
        , GrD3D11RenderTarget(gpu, dimensions, info, renderTargetView, label) {
    this->registerWithCacheWrapped(cacheable);
}

sk_sp<GrD3D11TextureRenderTarget> GrD3D11TextureRenderTarget::MakeNewTextureRenderTarget(
        GrD3D11Gpu* gpu,
        skgpu::Budgeted budgeted,
        SkISize dimensions,
        int sampleCnt,
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

    ID3D11ShaderResourceView* shaderResourceView = nullptr;
    {
        D3D11_SHADER_RESOURCE_VIEW_DESC viewDesc;
        viewDesc.Format = info.fFormat;
        viewDesc.ViewDimension = D3D11_SRV_DIMENSION_TEXTURE2D;
        viewDesc.Texture2D.MipLevels = -1;
        viewDesc.Texture2D.MostDetailedMip = 0;

        hr = gpu->device()->CreateShaderResourceView(
                info.fTexture.get(), &viewDesc, &shaderResourceView);
        GR_D3D_CALL_ERRCHECK(hr);
    }

    ID3D11RenderTargetView* renderTargetView = nullptr;
    {
        D3D11_RENDER_TARGET_VIEW_DESC viewDesc;
        viewDesc.Format = info.fFormat;
        viewDesc.ViewDimension = D3D11_RTV_DIMENSION_TEXTURE2D;
        viewDesc.Texture2D.MipSlice = 0;

        hr = gpu->device()->CreateRenderTargetView(
                info.fTexture.get(), &viewDesc, &renderTargetView);
        GR_D3D_CALL_ERRCHECK(hr);
    }

    GrD3D11TextureRenderTarget* trt = new GrD3D11TextureRenderTarget(gpu,
                                                                    budgeted,
                                                                    dimensions,
                                                                    info,
                                                                    shaderResourceView,
                                                                    renderTargetView,
                                                                    mipmapStatus,
                                                                    label);
    return sk_sp<GrD3D11TextureRenderTarget>(trt);
}

sk_sp<GrD3D11TextureRenderTarget> GrD3D11TextureRenderTarget::MakeWrappedTextureRenderTarget(
        GrD3D11Gpu* gpu,
        SkISize dimensions,
        int sampleCnt,
        GrWrapCacheable cacheable,
        const GrD3D11TextureInfo& info) {

    GrMipmapStatus mipmapStatus =
            info.fLevelCount > 1 ? GrMipmapStatus::kDirty : GrMipmapStatus::kNotAllocated;

    HRESULT hr;
    ID3D11ShaderResourceView* shaderResourceView = nullptr;
    {
        D3D11_SHADER_RESOURCE_VIEW_DESC viewDesc;
        viewDesc.Format = info.fFormat;
        viewDesc.ViewDimension = D3D11_SRV_DIMENSION_TEXTURE2D;
        viewDesc.Texture2D.MipLevels = -1;
        viewDesc.Texture2D.MostDetailedMip = 0;

        hr = gpu->device()->CreateShaderResourceView(
                info.fTexture.get(), &viewDesc, &shaderResourceView);
        GR_D3D_CALL_ERRCHECK(hr);
    }

    ID3D11RenderTargetView* renderTargetView = nullptr;
    {
        D3D11_RENDER_TARGET_VIEW_DESC viewDesc;
        viewDesc.Format = info.fFormat;
        viewDesc.ViewDimension = D3D11_RTV_DIMENSION_TEXTURE2D;
        viewDesc.Texture2D.MipSlice = 0;

        hr = gpu->device()->CreateRenderTargetView(
                info.fTexture.get(), &viewDesc, &renderTargetView);
        GR_D3D_CALL_ERRCHECK(hr);
    }

    return sk_sp<GrD3D11TextureRenderTarget>(
                new GrD3D11TextureRenderTarget(gpu,
                                             dimensions,
                                             info,
                                             shaderResourceView,
                                             renderTargetView,
                                             mipmapStatus,
                                             cacheable,
                                             /*label=*/"MakeWrappedTextureRenderTarget"));
}

size_t GrD3D11TextureRenderTarget::onGpuMemorySize() const {
    int numColorSamples = this->numSamples();
    if (numColorSamples > 1) {
        // Add one to account for the resolve VkImage.
        ++numColorSamples;
    }
    return GrSurface::ComputeSize(this->backendFormat(),
                                  this->dimensions(),
                                  numColorSamples,  // TODO: this still correct?
                                  this->mipmapped());
}

void GrD3D11TextureRenderTarget::onSetLabel() { GrD3D11RenderTarget::onSetLabel(); }
