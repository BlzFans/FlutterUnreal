
#pragma once

#include "src/gpu/ganesh/d3d11/GrD3D11Texture.h"
#include "src/gpu/ganesh/d3d11/GrD3D11RenderTarget.h"

class GrD3D11Gpu;

#ifdef SK_BUILD_FOR_WIN
// Windows gives bogus warnings about inheriting asTexture/asRenderTarget via dominance.
#pragma warning(push)
#pragma warning(disable : 4250)
#endif

class GrD3D11TextureRenderTarget : public GrD3D11Texture, public GrD3D11RenderTarget {
public:
    static sk_sp<GrD3D11TextureRenderTarget> MakeNewTextureRenderTarget(GrD3D11Gpu*,
                                                                      skgpu::Budgeted,
                                                                      SkISize dimensions,
                                                                      int sampleCnt,
                                                                      const D3D11_TEXTURE2D_DESC&,
                                                                      GrProtected isProtected,
                                                                      GrMipmapStatus,
                                                                      std::string_view label);

    static sk_sp<GrD3D11TextureRenderTarget> MakeWrappedTextureRenderTarget(
            GrD3D11Gpu*,
            SkISize dimensions,
            int sampleCnt,
            GrWrapCacheable,
            const GrD3D11TextureInfo&);

    GrBackendFormat backendFormat() const override {
        return GrD3D11RenderTarget::backendFormat();
    }

protected:
    void onAbandon() override {
        // In order to correctly handle calling texture idle procs, GrD3DTexture must go first.
        GrD3D11Texture::onAbandon();
        GrD3D11RenderTarget::onAbandon();
    }

    void onRelease() override {
        // In order to correctly handle calling texture idle procs, GrD3DTexture must go first.
        GrD3D11Texture::onRelease();
        GrD3D11RenderTarget::onRelease();
    }

private:
    // non-MSAA, not-wrapped
    GrD3D11TextureRenderTarget(GrD3D11Gpu* gpu,
                             skgpu::Budgeted budgeted,
                             SkISize dimensions,
                             const GrD3D11TextureInfo& info,
                             ID3D11ShaderResourceView* shaderResourceView,
                             ID3D11RenderTargetView* renderTargetView,
                             GrMipmapStatus,
                             std::string_view label);

    // non-MSAA, wrapped
    GrD3D11TextureRenderTarget(GrD3D11Gpu* gpu,
                             SkISize dimensions,
                             const GrD3D11TextureInfo& info,
                             ID3D11ShaderResourceView* shaderResourceView,
                             ID3D11RenderTargetView* renderTargetView,
                             GrMipmapStatus,
                             GrWrapCacheable,
                             std::string_view label);

    // GrGLRenderTarget accounts for the texture's memory and any MSAA renderbuffer's memory.
    size_t onGpuMemorySize() const override;

    void onSetLabel() override;
};

#ifdef SK_BUILD_FOR_WIN
#pragma warning(pop)
#endif
