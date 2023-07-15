/*
 * Copyright 2017 Google Inc.
 *
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */

#ifndef GrD3D11Gpu_DEFINED
#define GrD3D11Gpu_DEFINED

#include "src/gpu/ganesh/GrGpu.h"
#include "src/gpu/ganesh/GrRenderTarget.h"
#include "src/gpu/ganesh/GrSemaphore.h"
#include "src/gpu/ganesh/GrTexture.h"
#include "src/gpu/ganesh/d3d11/GrD3D11Caps.h"
#include "src/gpu/ganesh/d3d11/GrD3D11ResourceProvider.h"

#include "src/gpu/ganesh/d3d/GrD3DGpu.h"

class GrD3D11OpsRenderPass;
struct GrD3D11Options;
class GrPipeline;
class GrD3D11Texture;

#if GR_TEST_UTILS
struct IDXGraphicsAnalysis;
#endif

class GrD3D11Gpu : public GrGpu {
public:
    static sk_sp<GrGpu> Make(GrDirectContext*, const GrContextOptions&, const GrD3DBackendContext&);

    virtual ~GrD3D11Gpu() override;

    const GrD3D11Caps& d3d11Caps() const { return static_cast<const GrD3D11Caps&>(*this->caps()); }

    GrD3D11ResourceProvider& resourceProvider() { return fResourceProvider; }

    GrThreadSafePipelineBuilder* pipelineBuilder() override;
    sk_sp<GrThreadSafePipelineBuilder> refPipelineBuilder() override;

    ID3D11Device* device() const { return fDevice.get(); }
    ID3D11DeviceContext* deviceContext() const { return fDeviceContext.get(); }

    bool protectedContext() const { return false; }

    void xferBarrier(GrRenderTarget*, GrXferBarrierType) override {}

    void deleteBackendTexture(const GrBackendTexture&) override;

    bool compile(const GrProgramDesc&, const GrProgramInfo&) override;

#if GR_TEST_UTILS
    bool isTestingOnlyBackendTexture(const GrBackendTexture&) const override;

    GrBackendRenderTarget createTestingOnlyBackendRenderTarget(SkISize dimensions,
                                                               GrColorType,
                                                               int sampleCnt,
                                                               GrProtected) override;
    void deleteTestingOnlyBackendRenderTarget(const GrBackendRenderTarget&) override;

    void testingOnly_startCapture() override;
    void testingOnly_stopCapture() override;

    void resetShaderCacheForTesting() const override {
        fResourceProvider.resetShaderCacheForTesting();
    }
#endif

    sk_sp<GrAttachment> makeStencilAttachment(const GrBackendFormat& /*colorFormat*/,
                                              SkISize dimensions,
                                              int numStencilSamples) override;

    GrBackendFormat getPreferredStencilFormat(const GrBackendFormat&) override {
        return GrBackendFormat::MakeDxgi(this->d3d11Caps().preferredStencilFormat());
    }

    sk_sp<GrAttachment> makeMSAAAttachment(SkISize dimensions,
                                           const GrBackendFormat& format,
                                           int numSamples,
                                           GrProtected isProtected,
                                           GrMemoryless isMemoryless) override {
        return nullptr;
    }

    GrFence SK_WARN_UNUSED_RESULT insertFence() override { return 0; }
    bool waitFence(GrFence) override { return true; }
    void deleteFence(GrFence) override {}

    std::unique_ptr<GrSemaphore> SK_WARN_UNUSED_RESULT makeSemaphore(bool isOwned) override {
        return nullptr;
    }
    std::unique_ptr<GrSemaphore> wrapBackendSemaphore(const GrBackendSemaphore& /* semaphore */,
                                                      GrSemaphoreWrapType /* wraptype */,
                                                      GrWrapOwnership /* ownership */) override {
        return nullptr;
    }
    void insertSemaphore(GrSemaphore* semaphore) override {}
    void waitSemaphore(GrSemaphore* semaphore) override {}
    std::unique_ptr<GrSemaphore> prepareTextureForCrossContextUsage(GrTexture*) override {
        return nullptr;
    }

    void submit(GrOpsRenderPass* renderPass) override;
    void endRenderPass(GrRenderTarget* target, GrSurfaceOrigin origin, const SkIRect& bounds);

    void checkFinishProcs() override {}
    void finishOutstandingGpuWork() override {}

private:
    GrD3D11Gpu(GrDirectContext*, const GrContextOptions&, const GrD3DBackendContext&);

    void destroyResources();

    sk_sp<GrTexture> onCreateTexture(SkISize,
                                     const GrBackendFormat&,
                                     GrRenderable,
                                     int renderTargetSampleCnt,
                                     skgpu::Budgeted,
                                     GrProtected,
                                     int mipLevelCount,
                                     uint32_t levelClearMask,
                                     std::string_view label) override;

    sk_sp<GrTexture> onCreateCompressedTexture(SkISize dimensions,
                                               const GrBackendFormat&,
                                               skgpu::Budgeted,
                                               GrMipmapped,
                                               GrProtected,
                                               const void* data, size_t dataSize) override;

    sk_sp<GrTexture> onWrapBackendTexture(const GrBackendTexture&,
                                          GrWrapOwnership,
                                          GrWrapCacheable,
                                          GrIOType) override;
    sk_sp<GrTexture> onWrapCompressedBackendTexture(const GrBackendTexture&,
                                                    GrWrapOwnership,
                                                    GrWrapCacheable) override;

    sk_sp<GrTexture> onWrapRenderableBackendTexture(const GrBackendTexture&,
                                                    int sampleCnt,
                                                    GrWrapOwnership,
                                                    GrWrapCacheable) override;

    sk_sp<GrRenderTarget> onWrapBackendRenderTarget(const GrBackendRenderTarget&) override;

    sk_sp<GrGpuBuffer> onCreateBuffer(size_t sizeInBytes,
                                      GrGpuBufferType,
                                      GrAccessPattern) override;

    bool onReadPixels(GrSurface*,
                      SkIRect,
                      GrColorType surfaceColorType,
                      GrColorType dstColorType,
                      void*,
                      size_t rowBytes) override;

    bool onWritePixels(GrSurface*,
                       SkIRect,
                       GrColorType surfaceColorType,
                       GrColorType srcColorType,
                       const GrMipLevel[],
                       int mipLevelCount,
                       bool prepForTexSampling) override;

    bool onTransferFromBufferToBuffer(sk_sp<GrGpuBuffer> src,
                                      size_t srcOffset,
                                      sk_sp<GrGpuBuffer> dst,
                                      size_t dstOffset,
                                      size_t size) override;

    bool onTransferPixelsTo(GrTexture*,
                            SkIRect,
                            GrColorType surfaceColorType,
                            GrColorType bufferColorType,
                            sk_sp<GrGpuBuffer>,
                            size_t offset,
                            size_t rowBytes) override;

    bool onTransferPixelsFrom(GrSurface*,
                              SkIRect,
                              GrColorType surfaceColorType,
                              GrColorType bufferColorType,
                              sk_sp<GrGpuBuffer>,
                              size_t offset) override;

    bool onCopySurface(GrSurface* dst,
                       const SkIRect& dstRect,
                       GrSurface* src,
                       const SkIRect& srcRect,
                       GrSamplerState::Filter) override;

    bool onRegenerateMipMapLevels(GrTexture*) override;

    void onResolveRenderTarget(GrRenderTarget* target, const SkIRect&) override;

    void addFinishedProc(GrGpuFinishedProc finishedProc,
                         GrGpuFinishedContext finishedContext) override;

    GrOpsRenderPass* onGetOpsRenderPass(GrRenderTarget*,
                                        bool useMSAASurface,
                                        GrAttachment*,
                                        GrSurfaceOrigin,
                                        const SkIRect&,
                                        const GrOpsRenderPass::LoadAndStoreInfo&,
                                        const GrOpsRenderPass::StencilLoadAndStoreInfo&,
                                        const skia_private::TArray<GrSurfaceProxy*, true>& sampledProxies,
                                        GrXferBarrierFlags renderPassXferBarriers) override;

   void prepareSurfacesForBackendAccessAndStateUpdates(
            SkSpan<GrSurfaceProxy*> proxies,
            SkSurface::BackendSurfaceAccess access,
            const skgpu::MutableTextureState* newState) override {}

    bool onSubmitToGpu(bool syncCpu) override {
        return true;
    }

    GrBackendTexture onCreateBackendTexture(SkISize dimensions,
                                            const GrBackendFormat&,
                                            GrRenderable,
                                            GrMipmapped,
                                            GrProtected,
                                            std::string_view label) override;

    bool onClearBackendTexture(const GrBackendTexture&,
                               sk_sp<skgpu::RefCntedCallback> finishedCallback,
                               std::array<float, 4> color) override;

    GrBackendTexture onCreateCompressedBackendTexture(SkISize dimensions,
                                                      const GrBackendFormat&,
                                                      GrMipmapped,
                                                      GrProtected) override;

    bool onUpdateCompressedBackendTexture(const GrBackendTexture&,
                                          sk_sp<skgpu::RefCntedCallback> finishedCallback,
                                          const void*,
                                          size_t) override;

    void copySurfaceAsCopyTexture(GrSurface* dst,
                                  GrSurface* src,
                                  ID3D11Texture2D* dstResource,
                                  ID3D11Texture2D* srcResource,
                                  const SkIRect& srcRect,
                                  const SkIPoint& dstPoint);

    void copySurfaceAsResolve(GrSurface* dst,
                              GrSurface* src,
                              const SkIRect& srcRect,
                              const SkIPoint& dstPoint);
    void resolveTexture(GrSurface* dst,
                        int32_t dstX,
                        int32_t dstY,
                        GrD3D11RenderTarget* src,
                        const SkIRect& srcRect);

    sk_sp<GrD3D11Texture> createD3D11Texture(SkISize,
                                         DXGI_FORMAT,
                                         GrRenderable,
                                         int renderTargetSampleCnt,
                                         skgpu::Budgeted,
                                         GrProtected,
                                         int mipLevelCount,
                                         GrMipmapStatus,
                                         std::string_view label);

    bool uploadToTexture(GrD3D11Texture* tex,
                         SkIRect rect,
                         const GrMipLevel texels[],
                         int mipLevelCount);

    bool uploadToTexture(ID3D11Texture2D* tex,
                         SkIRect rect,
                         const GrMipLevel texels[],
                         int mipLevelCount);


    bool createTextureResourceForBackendSurface(DXGI_FORMAT dxgiFormat,
                                                SkISize dimensions,
                                                GrTexturable texturable,
                                                GrRenderable renderable,
                                                GrMipmapped mipmapped,
                                                int sampleCnt,
                                                GrD3D11TextureInfo* info,
                                                GrProtected isProtected);

    gr_cp<ID3D11Device> fDevice;
    gr_cp<ID3D11DeviceContext> fDeviceContext;
    
    GrD3D11ResourceProvider fResourceProvider;

    std::unique_ptr<GrD3D11OpsRenderPass> fCachedOpsRenderPass;

#if GR_TEST_UTILS
    IDXGraphicsAnalysis* fGraphicsAnalysis;
#endif

    using INHERITED = GrGpu;
};

#endif
