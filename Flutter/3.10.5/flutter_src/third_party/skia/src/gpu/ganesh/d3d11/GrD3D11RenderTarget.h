#pragma once

#include "src/gpu/ganesh/GrRenderTarget.h"
#include "src/gpu/ganesh/d3d11/GrD3D11Gpu.h"

class GrD3D11RenderTarget : public GrRenderTarget {
public:
    static sk_sp<GrD3D11RenderTarget> MakeWrappedRenderTarget(GrD3D11Gpu*,
                                                            SkISize,
                                                            int sampleCnt,
                                                            const GrD3D11TextureInfo&);

    ~GrD3D11RenderTarget() override;

    GrBackendFormat backendFormat() const override { return fInfo.getBackendFormat(); }

    bool canAttemptStencilAttachment(bool useMSAASurface) const override {
        SkASSERT(useMSAASurface == (this->numSamples() > 1));
        return true;
    }

    GrBackendRenderTarget getBackendRenderTarget() const override;

    ID3D11RenderTargetView* colorRenderTargetView() {
        return fColorRenderTargetView;
    }

    DXGI_FORMAT stencilDxgiFormat() const;

    // Key used for the program desc
    void genKey(skgpu::KeyBuilder* b) const;

    ID3D11Texture2D* d3d11Resource() const {
        return fInfo.fTexture.get();
    }
    DXGI_FORMAT dxgiFormat() const { return fInfo.fFormat; }

    const GrD3D11TextureInfo& getInfo() const { 
        return fInfo;
    }

protected:
    GrD3D11RenderTarget(GrD3D11Gpu* gpu,
                      SkISize dimensions,
                      const GrD3D11TextureInfo& info,
                      ID3D11RenderTargetView* renderTargetView,
                      std::string_view label);

    void onAbandon() override;
    void onRelease() override;

    // This accounts for the texture's memory and any MSAA renderbuffer's memory.
    size_t onGpuMemorySize() const override {
        int numColorSamples = this->numSamples();
        if (numColorSamples > 1) {
            // Add one to account for the resolved VkImage.
            numColorSamples += 1;
        }
        return GrSurface::ComputeSize(
                this->backendFormat(), this->dimensions(), numColorSamples, GrMipmapped::kNo);
    }

    void onSetLabel() override;

private:
    // Extra param to disambiguate from constructor used by subclasses.
    enum Wrapped { kWrapped };
    GrD3D11RenderTarget(GrD3D11Gpu* gpu,
                      SkISize dimensions,
                      const GrD3D11TextureInfo& info,
                      ID3D11RenderTargetView* renderTargetView,
                      Wrapped,
                      std::string_view label);

    GrD3D11Gpu* getD3D11Gpu() const;

    bool completeStencilAttachment(GrAttachment* stencil, bool useMSAASurface) override {
        SkASSERT(useMSAASurface == (this->numSamples() > 1));
        return true;
    }

    void releaseInternalObjects();

    ID3D11RenderTargetView* fColorRenderTargetView = nullptr;

    GrD3D11TextureInfo fInfo;

    using INHERITED = GrRenderTarget;
};
