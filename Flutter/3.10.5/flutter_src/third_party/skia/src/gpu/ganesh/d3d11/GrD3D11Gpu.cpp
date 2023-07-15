/*
 * Copyright 2017 Google Inc.
 *
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */

#include "src/core/SkCompressedDataUtils.h"
#include "src/gpu/ganesh/d3d11/GrD3D11Gpu.h"

#include "src/gpu/ganesh/GrThreadSafePipelineBuilder.h"
#include "src/core/SkMipmap.h"
#include "src/gpu/ganesh/d3d11/GrD3D11Attachment.h"
#include "src/gpu/ganesh/d3d11/GrD3D11Buffer.h"
#include "src/gpu/ganesh/d3d11/GrD3D11Caps.h"
#include "src/gpu/ganesh/d3d11/GrD3D11OpsRenderPass.h"
#include "src/gpu/ganesh/d3d11/GrD3D11Texture.h"
#include "src/gpu/ganesh/d3d11/GrD3D11RenderTarget.h"
#include "src/gpu/ganesh/d3d11/GrD3D11TextureRenderTarget.h"
#include "src/gpu/ganesh/d3d/GrD3DUtil.h"

#include "include/gpu/d3d/GrD3DBackendContext.h"

#if GR_TEST_UTILS
#include <DXProgrammableCapture.h>
#endif

GrThreadSafePipelineBuilder* GrD3D11Gpu::pipelineBuilder() { 
    return nullptr; 
}

sk_sp<GrThreadSafePipelineBuilder> GrD3D11Gpu::refPipelineBuilder() { 
    return nullptr; 
}

sk_sp<GrGpu> GrD3D11Gpu::Make(GrDirectContext* direct,
                              const GrContextOptions& contextOptions,
                              const GrD3DBackendContext& backendContext) {
    return sk_sp<GrGpu>(new GrD3D11Gpu(direct, contextOptions, backendContext));
}

GrD3D11Gpu::GrD3D11Gpu(GrDirectContext* direct,
                       const GrContextOptions& contextOptions,
                       const GrD3DBackendContext& backendContext)
        :INHERITED(direct), fResourceProvider(this) {
    auto device = (ID3D11Device*)backendContext.fD3D11Device;
    auto deviceContext = (ID3D11DeviceContext*)backendContext.fD3D11DeviceContext;

    fDevice.retain(device);
    fDeviceContext.retain(deviceContext);

    IDXGIDevice* pDXGIDevice;
    auto hr = device->QueryInterface(__uuidof(IDXGIDevice), (void**)&pDXGIDevice);
    GR_D3D_CALL_ERRCHECK(hr);

    IDXGIAdapter1* adapter1 = nullptr;
    IDXGIAdapter* adapter;
    hr = pDXGIDevice->GetAdapter(&adapter);
    GR_D3D_CALL_ERRCHECK(hr);

    hr = adapter->QueryInterface(__uuidof(IDXGIAdapter1), (void**)&adapter1);
    GR_D3D_CALL_ERRCHECK(hr);

    this->initCapsAndCompiler(
            sk_make_sp<GrD3D11Caps>(contextOptions, adapter1, fDevice.get()));

    adapter1->Release();
    adapter->Release();
    pDXGIDevice->Release();

#if GR_TEST_UTILS
    HRESULT getAnalysis = DXGIGetDebugInterface1(0, IID_PPV_ARGS(&fGraphicsAnalysis));
    if (FAILED(getAnalysis)) {
        fGraphicsAnalysis = nullptr;
    }
#endif
}

GrD3D11Gpu::~GrD3D11Gpu() {
    destroyResources();
}

void GrD3D11Gpu::destroyResources() {
    fResourceProvider.destroyResources();
    fDeviceContext.reset();
    fDevice.reset();
#if GR_TEST_UTILS
    GrSafeComRelease(fGraphicsAnalysis);
#endif
}

GrOpsRenderPass* GrD3D11Gpu::onGetOpsRenderPass(GrRenderTarget* rt,
                                               bool /*useMSAASurface*/,
                                               GrAttachment*,
                                               GrSurfaceOrigin origin,
                                               const SkIRect& bounds,
                                               const GrOpsRenderPass::LoadAndStoreInfo& colorInfo,
                                               const GrOpsRenderPass::StencilLoadAndStoreInfo& stencilInfo,
                                               const skia_private::TArray<GrSurfaceProxy*,true>& sampledProxies,
                                               GrXferBarrierFlags renderPassXferBarriers) {
    if (!fCachedOpsRenderPass) {
        fCachedOpsRenderPass.reset(new GrD3D11OpsRenderPass(this));
    }

    if (!fCachedOpsRenderPass->set(rt, origin, bounds, colorInfo, stencilInfo, sampledProxies)) {
        return nullptr;
    }

    return fCachedOpsRenderPass.get();
}

void GrD3D11Gpu::submit(GrOpsRenderPass* renderPass) {
    SkASSERT(fCachedOpsRenderPass.get() == renderPass);

    fCachedOpsRenderPass->submit();
    fCachedOpsRenderPass.reset();
}

void GrD3D11Gpu::endRenderPass(GrRenderTarget* target,
                             GrSurfaceOrigin origin,
                             const SkIRect& bounds) {
    this->didWriteToSurface(target, origin, &bounds);
}

void GrD3D11Gpu::addFinishedProc(GrGpuFinishedProc finishedProc,
                               GrGpuFinishedContext finishedContext) {
    SkASSERT(finishedProc);
    finishedProc(finishedContext);
}

sk_sp<GrD3D11Texture> GrD3D11Gpu::createD3D11Texture(SkISize dimensions,
                                               DXGI_FORMAT dxgiFormat,
                                               GrRenderable renderable,
                                               int renderTargetSampleCnt,
                                               skgpu::Budgeted budgeted,
                                               GrProtected isProtected,
                                               int mipLevelCount,
                                               GrMipmapStatus mipmapStatus,
                                               std::string_view label) {
    
    D3D11_USAGE usage = D3D11_USAGE_DEFAULT;
    UINT bindFlags = D3D11_BIND_SHADER_RESOURCE;
    UINT cpuFlags = 0;
    UINT miscFlags = 0;

    if (renderable == GrRenderable::kYes) {
        bindFlags |= D3D11_BIND_RENDER_TARGET;
        //bindFlags |= D3D11_BIND_DEPTH_STENCIL;
    }

    // This desc refers to a texture that will be read by the client. Thus even if msaa is
    // requested, this describes the resolved texture. Therefore we always have samples set
    // to 1.
    SkASSERT(mipLevelCount > 0);
    D3D11_TEXTURE2D_DESC resourceDesc = {};
    resourceDesc.Width = dimensions.fWidth;
    resourceDesc.Height = dimensions.fHeight;
    resourceDesc.MipLevels = mipLevelCount;
    resourceDesc.Format = dxgiFormat;
    resourceDesc.SampleDesc.Count = 1;
    resourceDesc.SampleDesc.Quality = 0;
    resourceDesc.Usage = usage;
    resourceDesc.BindFlags = bindFlags;
    resourceDesc.CPUAccessFlags = cpuFlags;
    resourceDesc.MiscFlags = miscFlags;
    resourceDesc.ArraySize = 1;

    if (renderable == GrRenderable::kYes) {
        resourceDesc.BindFlags |= D3D11_BIND_RENDER_TARGET;
        if (mipLevelCount > 1 && mipmapStatus != GrMipmapStatus::kValid) {
            resourceDesc.MiscFlags |= D3D11_RESOURCE_MISC_GENERATE_MIPS;
        }
        return GrD3D11TextureRenderTarget::MakeNewTextureRenderTarget(this,
                                                                    budgeted,
                                                                    dimensions,
                                                                    renderTargetSampleCnt,
                                                                    resourceDesc,
                                                                    isProtected,
                                                                    mipmapStatus,
                                                                    label);
    } else {
        if (mipLevelCount > 1 && mipmapStatus != GrMipmapStatus::kValid) {
            resourceDesc.MiscFlags |= D3D11_RESOURCE_MISC_GENERATE_MIPS;
            resourceDesc.BindFlags |= D3D11_BIND_RENDER_TARGET;
        }
        return GrD3D11Texture::MakeNewTexture(
                this, budgeted, dimensions, resourceDesc, isProtected, mipmapStatus, label);
    }
}

sk_sp<GrTexture> GrD3D11Gpu::onCreateTexture(SkISize dimensions,
                                            const GrBackendFormat& format,
                                            GrRenderable renderable,
                                            int renderTargetSampleCnt,
                                            skgpu::Budgeted budgeted,
                                            GrProtected isProtected,
                                            int mipLevelCount,
                                            uint32_t levelClearMask,
                                            std::string_view label) {

    DXGI_FORMAT dxgiFormat;
    SkAssertResult(format.asDxgiFormat(&dxgiFormat));
    SkASSERT(!GrDxgiFormatIsCompressed(dxgiFormat));

    GrMipmapStatus mipmapStatus =
            mipLevelCount > 1 ? GrMipmapStatus::kDirty : GrMipmapStatus::kNotAllocated;

    sk_sp<GrD3D11Texture> tex = this->createD3D11Texture(dimensions,
                                                     dxgiFormat,
                                                     renderable,
                                                     renderTargetSampleCnt,
                                                     budgeted,
                                                     isProtected,
                                                     mipLevelCount,
                                                     mipmapStatus,
                                                     label);
    if (!tex) {
        return nullptr;
    }

    if (levelClearMask) {
        // TODO
    }

    return std::move(tex);
}

// TODO: why no 'isProtected' ?!
sk_sp<GrTexture> GrD3D11Gpu::onCreateCompressedTexture(SkISize dimensions,
                                                      const GrBackendFormat& format,
                                                      skgpu::Budgeted budgeted,
                                                      GrMipmapped mipmapped,
                                                      GrProtected isProtected,
                                                      const void* data, size_t dataSize) {
    DXGI_FORMAT dxgiFormat;
    SkAssertResult(format.asDxgiFormat(&dxgiFormat));
    SkASSERT(GrDxgiFormatIsCompressed(dxgiFormat));

    SkTextureCompressionType compressionType = GrBackendFormatToCompressionType(format);
    SkASSERT(dataSize == SkCompressedFormatDataSize(
                                 compressionType, dimensions, mipmapped == GrMipmapped::kYes));

    int mipLevelCount = 1;
    if (mipmapped == GrMipmapped::kYes) {
        mipLevelCount = SkMipmap::ComputeLevelCount(dimensions.width(), dimensions.height()) + 1;
    }
    GrMipmapStatus mipmapStatus =
            mipLevelCount > 1 ? GrMipmapStatus::kValid : GrMipmapStatus::kNotAllocated;

    sk_sp<GrD3D11Texture> d3d11Tex = this->createD3D11Texture(dimensions,
                                                        dxgiFormat,
                                                        GrRenderable::kNo,
                                                        1,
                                                        budgeted,
                                                        isProtected,
                                                        mipLevelCount,
                                                        mipmapStatus,
                                                        /*label=*/"D3DGpu_CreateCompressedTexture");
    if (!d3d11Tex) {
        return nullptr;
    }

    ID3D11Texture2D* d3d11Resource = d3d11Tex->d3d11Resource();
    SkASSERT(d3d11Resource);
    D3D11_TEXTURE2D_DESC desc; 
    d3d11Resource->GetDesc(&desc);

    // Either upload only the first miplevel or all miplevels
    SkASSERT(1 == mipLevelCount || mipLevelCount == (int)desc.MipLevels);

    SkIRect rect;
    rect.setXYWH(0, 0, dimensions.width(), dimensions.height());

    GrMipLevel mipLevels[32];
    
    const char* ptr = (const char*)data;
    for (int i = 0; i < mipLevelCount; ++i) {
        size_t levelDataSize = SkCompressedDataSize(compressionType, dimensions, nullptr, false);

        mipLevels[i].fPixels = ptr;
        mipLevels[i].fRowBytes = levelDataSize / dimensions.height(); 
        ptr += levelDataSize;
        dimensions = {std::max(1, dimensions.width() / 2), std::max(1, dimensions.height() / 2)};
    }

    uploadToTexture(d3d11Tex.get(), rect, mipLevels, mipLevelCount);
    return d3d11Tex;
}

static int get_surface_sample_cnt(GrSurface* surf) {
    if (const GrRenderTarget* rt = surf->asRenderTarget()) {
        return rt->numSamples();
    }
    return 0;
}

bool GrD3D11Gpu::onCopySurface(GrSurface* dst,
                             const SkIRect& dstRect,
                             GrSurface* src,
                             const SkIRect& srcRect,
                             GrSamplerState::Filter) {
    if (srcRect.size() != dstRect.size()) {
        return false;
    }
    if (src->isProtected() && !dst->isProtected()) {
        SkDebugf("Can't copy from protected memory to non-protected");
        return false;
    }

    int dstSampleCnt = get_surface_sample_cnt(dst);
    int srcSampleCnt = get_surface_sample_cnt(src);

    DXGI_FORMAT dstFormat;
    ID3D11Texture2D* dstTexResource;
    GrD3D11RenderTarget* dstRT = (GrD3D11RenderTarget*)dst->asRenderTarget();
    if (dstRT) {
        dstFormat = dstRT->dxgiFormat();
        dstTexResource = dstRT->d3d11Resource();
    } else {
        SkASSERT(dst->asTexture());
        GrD3D11Texture* dstTex = static_cast<GrD3D11Texture*>(dst->asTexture());
        dstFormat = dstTex->dxgiFormat();
        dstTexResource = dstTex->d3d11Resource();
    }

    DXGI_FORMAT srcFormat;
    ID3D11Texture2D* srcTexResource;
    GrD3D11RenderTarget* srcRT = (GrD3D11RenderTarget*)src->asRenderTarget();
    if (srcRT) {
        srcFormat = srcRT->dxgiFormat();
        srcTexResource = srcRT->d3d11Resource();
    } else {
        SkASSERT(src->asTexture());
        GrD3D11Texture* srcTex = static_cast<GrD3D11Texture*>(src->asTexture());
        srcFormat = srcTex->dxgiFormat();
        srcTexResource = srcTex->d3d11Resource();
    }

    const SkIPoint dstPoint = dstRect.topLeft();
    if (this->d3d11Caps().canCopyAsResolve(dstFormat, dstSampleCnt, srcFormat, srcSampleCnt)) {
        this->copySurfaceAsResolve(dst, src, srcRect, dstPoint);
        return true;
    }

    if (this->d3d11Caps().canCopyTexture(dstFormat, dstSampleCnt, srcFormat, srcSampleCnt)) {
        this->copySurfaceAsCopyTexture(dst, src, dstTexResource, srcTexResource, srcRect, dstPoint);
        return true;
    }

    return false;
}

void GrD3D11Gpu::copySurfaceAsCopyTexture(GrSurface* dst,
                                        GrSurface* src,
                                        ID3D11Texture2D* dstResource,
                                        ID3D11Texture2D* srcResource,
                                        const SkIRect& srcRect,
                                        const SkIPoint& dstPoint) {
#ifdef SK_DEBUG
    int dstSampleCnt = get_surface_sample_cnt(dst);
    int srcSampleCnt = get_surface_sample_cnt(src);
    DXGI_FORMAT dstFormat;
    DXGI_FORMAT srcFormat;
    dst->backendFormat().asDxgiFormat(&dstFormat);
    SkAssertResult(dst->backendFormat().asDxgiFormat(&srcFormat));
    SkASSERT(this->d3d11Caps().canCopyTexture(dstFormat, dstSampleCnt, srcFormat, srcSampleCnt));
#endif

    if (src->isProtected() && !dst->isProtected()) {
        SkDebugf("Can't copy from protected memory to non-protected");
        return;
    }

    D3D11_BOX srcBox = {};
    srcBox.left = srcRect.fLeft;
    srcBox.top = srcRect.fTop;
    srcBox.right = srcRect.fRight;
    srcBox.bottom = srcRect.fBottom;
    srcBox.front = 0;
    srcBox.back = 1;

    deviceContext()->CopySubresourceRegion(
            dstResource, 0, dstPoint.fX, dstPoint.fY, 0, srcResource, 0, &srcBox);

    SkIRect dstRect =
            SkIRect::MakeXYWH(dstPoint.fX, dstPoint.fY, srcRect.width(), srcRect.height());
    // The rect is already in device space so we pass in kTopLeft so no flip is done.
    this->didWriteToSurface(dst, kTopLeft_GrSurfaceOrigin, &dstRect);
}

void GrD3D11Gpu::copySurfaceAsResolve(GrSurface* dst,
                                    GrSurface* src,
                                    const SkIRect& srcRect,
                                    const SkIPoint& dstPoint) {
    GrD3D11RenderTarget* srcRT = static_cast<GrD3D11RenderTarget*>(src->asRenderTarget());
    SkASSERT(srcRT);

    this->resolveTexture(dst, dstPoint.fX, dstPoint.fY, srcRT, srcRect);
    SkIRect dstRect =
            SkIRect::MakeXYWH(dstPoint.fX, dstPoint.fY, srcRect.width(), srcRect.height());
    // The rect is already in device space so we pass in kTopLeft so no flip is done.
    this->didWriteToSurface(dst, kTopLeft_GrSurfaceOrigin, &dstRect);
}

void GrD3D11Gpu::resolveTexture(GrSurface* dst,
                              int32_t dstX,
                              int32_t dstY,
                              GrD3D11RenderTarget* src,
                              const SkIRect& srcIRect) {
    SkASSERT(dst);
    SkASSERT(src && src->numSamples() > 1);

    //D3D11_RECT srcRect = {srcIRect.fLeft, srcIRect.fTop, srcIRect.fRight, srcIRect.fBottom};

    //ID3D11Texture2D* dstResource = nullptr;
    //deviceContext()->ResolveSubresource(dstResource, 0, src->getInfo().fTexture.get(), 0, src->dxgiFormat());
    SkASSERT(false);
}

void GrD3D11Gpu::onResolveRenderTarget(GrRenderTarget* target, const SkIRect& resolveRect) {
    SkASSERT(target->numSamples() > 1);
    GrD3D11RenderTarget* rt = static_cast<GrD3D11RenderTarget*>(target);
    //SkASSERT(rt->msaaTextureResource() && rt != rt->msaaTextureResource());

    this->resolveTexture(target, resolveRect.fLeft, resolveRect.fTop, rt, resolveRect);
}

bool GrD3D11Gpu::onReadPixels(GrSurface* surface,
                              SkIRect rect,
                              GrColorType surfaceColorType,
                              GrColorType dstColorType,
                              void* buffer,
                              size_t rowBytes) {
    SkASSERT(surface);

    if (surfaceColorType != dstColorType) {
        return false;
    }

    // Copy back to CPU buffer
    size_t bpp = GrColorTypeBytesPerPixel(dstColorType);
    size_t tightRowBytes = bpp * rect.width();

    ID3D11Texture2D* texResource = nullptr;
    DXGI_FORMAT format;
    GrD3D11RenderTarget* rt = static_cast<GrD3D11RenderTarget*>(surface->asRenderTarget());
    if (rt) {
        texResource = rt->d3d11Resource();
        format = rt->dxgiFormat();
    } else {
        GrD3D11Texture* tex = static_cast<GrD3D11Texture*>(surface->asTexture());
        texResource = tex->d3d11Resource();
        format = tex->dxgiFormat();
    }

    if (!texResource) {
        return false;
    }

    if (GrDxgiFormatBytesPerBlock(format) != bpp) {
        return false;
    }

    D3D11_TEXTURE2D_DESC desc = {};
    texResource->GetDesc(&desc);
    desc.Usage = D3D11_USAGE_STAGING;
    desc.CPUAccessFlags = D3D11_CPU_ACCESS_READ;
    desc.BindFlags = 0;
    desc.MiscFlags = 0;

    gr_cp<ID3D11Texture2D> stagingTex;
    auto hr = device()->CreateTexture2D(&desc, nullptr, &stagingTex);
    GR_D3D_CALL_ERRCHECK(hr);
    deviceContext()->CopyResource(stagingTex.get(), texResource);

    D3D11_MAPPED_SUBRESOURCE mapInfo;
    hr = deviceContext()->Map(stagingTex.get(), 0, D3D11_MAP_READ, 0, &mapInfo);
    GR_D3D_CALL_ERRCHECK(hr);
    SkRectMemcpy(buffer, rowBytes, mapInfo.pData, mapInfo.RowPitch, tightRowBytes, rect.height());
    deviceContext()->Unmap(stagingTex.get(), 0);

    return true;
}

bool GrD3D11Gpu::onWritePixels(GrSurface* surface,
                               SkIRect rect,
                               GrColorType surfaceColorType,
                               GrColorType srcColorType,
                               const GrMipLevel texels[],
                               int mipLevelCount,
                               bool prepForTexSampling) {
    GrD3D11Texture* d3dTex = static_cast<GrD3D11Texture*>(surface->asTexture());
    if (!d3dTex) {
        return false;
    }

    // Make sure we have at least the base level
    if (!mipLevelCount || !texels[0].fPixels) {
        return false;
    }

    SkASSERT(!GrDxgiFormatIsCompressed(d3dTex->dxgiFormat()));
    bool success = false;

    SkASSERT(mipLevelCount <= d3dTex->maxMipmapLevel() + 1);
    success = this->uploadToTexture(d3dTex, rect, texels, mipLevelCount);

    return success;
}

bool GrD3D11Gpu::uploadToTexture(GrD3D11Texture* tex,
                                 SkIRect rect,
                                 const GrMipLevel* texels,
                                 int mipLevelCount) {
    SkASSERT(this->d3d11Caps().isFormatTexturable(tex->dxgiFormat()));

    // The assumption is either that we have no mipmaps, or that our rect is the entire texture
    SkASSERT(mipLevelCount == 1 || rect == SkIRect::MakeSize(tex->dimensions()));

    // We assume that if the texture has mip levels, we either upload to all the levels or just the
    // first.
    SkASSERT(mipLevelCount == 1 || mipLevelCount == (tex->maxMipmapLevel() + 1));

    if (rect.isEmpty()) {
        return false;
    }

    //SkASSERT(this->d3d11Caps().surfaceSupportsWritePixels(tex));

    ID3D11Texture2D* d3d11Resource = tex->d3d11Resource();
    SkASSERT(d3d11Resource);
    D3D11_TEXTURE2D_DESC desc;
    d3d11Resource->GetDesc(&desc);
    bool ret = uploadToTexture(d3d11Resource, rect, texels, mipLevelCount);

    if (ret && mipLevelCount < (int)desc.MipLevels) {
        tex->markMipmapsDirty();
    }

    return ret;
}

bool GrD3D11Gpu::uploadToTexture(ID3D11Texture2D* d3d11Resource,
                     SkIRect rect,
                     const GrMipLevel texels[],
                     int mipLevelCount) {
    SkASSERT(d3d11Resource);
    D3D11_TEXTURE2D_DESC desc;
    d3d11Resource->GetDesc(&desc);

    // Either upload only the first miplevel or all miplevels
    SkASSERT(1 == mipLevelCount || mipLevelCount == (int)desc.MipLevels);

    if (1 == mipLevelCount && !texels[0].fPixels) {
        return true;  // no data to upload
    }

    for (int i = 0; i < mipLevelCount; ++i) {
        // We do not allow any gaps in the mip data
        if (!texels[i].fPixels) {
            return false;
        }
    }

    D3D11_BOX dstBox;
    dstBox.left = rect.fLeft;
    dstBox.right = rect.fRight;
    dstBox.top = rect.fTop;
    dstBox.bottom = rect.fBottom;
    dstBox.front = 0;
    dstBox.back = 1;
    for (int i = 0; i < mipLevelCount; ++i) {
        // We do not allow any gaps in the mip data
        if (!texels[i].fPixels) {
            return false;
        }

        deviceContext()->UpdateSubresource(d3d11Resource,
                                           i,
                                           i == 0 ? &dstBox : nullptr,
                                           texels[i].fPixels,
                                           texels[i].fRowBytes,
                                           rect.height() * texels[i].fRowBytes);
    }

    return true;
}

bool GrD3D11Gpu::onTransferFromBufferToBuffer(sk_sp<GrGpuBuffer> src,
                                            size_t srcOffset,
                                            sk_sp<GrGpuBuffer> dst,
                                            size_t dstOffset,
                                            size_t size) {

    sk_sp<GrD3D11Buffer> d3d11Src(static_cast<GrD3D11Buffer*>(src.release()));
    sk_sp<GrD3D11Buffer> d3d11Dst(static_cast<GrD3D11Buffer*>(dst.release()));

    D3D11_BUFFER_DESC srcDesc, dstDesc;
    d3d11Src->d3d11Resource()->GetDesc(&srcDesc);
    d3d11Dst->d3d11Resource()->GetDesc(&dstDesc);

    uint64_t dstSize = dstDesc.ByteWidth;
    uint64_t srcSize = srcDesc.ByteWidth;

    if (dstSize == srcSize && srcSize == size)
        deviceContext()->CopyResource(d3d11Dst->d3d11Resource(), d3d11Src->d3d11Resource());
    else {
        D3D11_BOX srcBox;
        srcBox.left = srcOffset;
        srcBox.right = srcOffset + size;
        srcBox.top = 0;
        srcBox.bottom = 1;
        srcBox.front = 0;
        srcBox.back = 1;
        deviceContext()->CopySubresourceRegion(d3d11Dst->d3d11Resource(),
                                               0,
                                               dstOffset,
                                               0,
                                               0,
                                               d3d11Src->d3d11Resource(),
                                               0,
                                               &srcBox);
    }

    return true;
}

bool GrD3D11Gpu::onTransferPixelsTo(GrTexture* texture,
                                  SkIRect rect,
                                  GrColorType surfaceColorType,
                                  GrColorType bufferColorType,
                                  sk_sp<GrGpuBuffer> transferBuffer,
                                  size_t bufferOffset,
                                  size_t rowBytes) {
    if (!transferBuffer) {
        return false;
    }

    size_t bpp = GrColorTypeBytesPerPixel(bufferColorType);
    if (GrBackendFormatBytesPerPixel(texture->backendFormat()) != bpp) {
        return false;
    }

    // D3D requires offsets for texture transfers to be aligned to this value
    if (SkToBool(bufferOffset & (512 - 1))) { //D3D12_TEXTURE_DATA_PLACEMENT_ALIGNMENT
        return false;
    }

    GrD3D11Texture* d3d11Tex = static_cast<GrD3D11Texture*>(texture);
    if (!d3d11Tex) {
        return false;
    }

    SkDEBUGCODE(DXGI_FORMAT format = d3d11Tex->dxgiFormat());

    // Can't transfer compressed data
    SkASSERT(!GrDxgiFormatIsCompressed(format));

    SkASSERT(GrDxgiFormatBytesPerBlock(format) == GrColorTypeBytesPerPixel(bufferColorType));

    SkASSERT(SkIRect::MakeSize(texture->dimensions()).contains(rect));

    // Set up copy region
    ID3D11Buffer* d3d11Buffer = static_cast<GrD3D11Buffer*>(transferBuffer.get())->d3d11Resource();
    deviceContext()->CopySubresourceRegion(
            d3d11Tex->d3d11Resource(), 0, rect.left(), rect.top(), 0, d3d11Buffer, 0, nullptr);

    d3d11Tex->markMipmapsDirty();
    return true;
}

bool GrD3D11Gpu::onTransferPixelsFrom(GrSurface* surface,
                                    SkIRect rect,
                                    GrColorType surfaceColorType,
                                    GrColorType bufferColorType,
                                    sk_sp<GrGpuBuffer> transferBuffer,
                                    size_t offset) {
    SkASSERT(surface);
    SkASSERT(transferBuffer);
    // TODO
    // if (fProtectedContext == GrProtected::kYes) {
    //    return false;
    //}

    // D3D requires offsets for texture transfers to be aligned to this value
    if (SkToBool(offset & (512 - 1))) { //D3D12_TEXTURE_DATA_PLACEMENT_ALIGNMENT
        return false;
    }

    ID3D11Texture2D* texResource = nullptr;
    SkDEBUGCODE(DXGI_FORMAT format);
    GrD3D11RenderTarget* rt = static_cast<GrD3D11RenderTarget*>(surface->asRenderTarget());
    if (rt) {
        texResource = rt->d3d11Resource();
        SkDEBUGCODE(format = rt->dxgiFormat());
    } else {
        texResource = static_cast<GrD3D11Texture*>(surface->asTexture())->d3d11Resource();
        SkDEBUGCODE(format = static_cast<GrD3D11Texture*>(surface->asTexture())->dxgiFormat());
    }

    if (!texResource) {
        return false;
    }

    SkASSERT(GrDxgiFormatBytesPerBlock(format) == GrColorTypeBytesPerPixel(bufferColorType));

    D3D11_BOX srcBox = {};
    srcBox.left = rect.left();
    srcBox.top = rect.top();
    srcBox.right = rect.right();
    srcBox.bottom = rect.bottom();
    srcBox.front = 0;
    srcBox.back = 1;
    ID3D11Buffer* d3d11Buffer = static_cast<GrD3D11Buffer*>(transferBuffer.get())->d3d11Resource();
    deviceContext()->CopySubresourceRegion(d3d11Buffer, 0, 0, 0, 0, texResource, 0, &srcBox);

    return true;
}

static bool check_resource_info(const GrD3D11TextureInfo& info) {
    if (!info.fTexture.get()) {
        return false;
    }
    return true;
}

static bool check_tex_resource_info(const GrD3D11Caps& caps, const GrD3D11TextureInfo& info) {
    if (!caps.isFormatTexturable(info.fFormat)) {
        return false;
    }
    // We don't support sampling from multisampled textures.
    if (info.fSampleCount != 1) {
        return false;
    }
    return true;
}

static bool check_rt_resource_info(const GrD3D11Caps& caps,
                                   const GrD3D11TextureInfo& info,
                                   int sampleCnt) {
    if (!caps.isFormatRenderable(info.fFormat, sampleCnt)) {
        return false;
    }
    return true;
}

sk_sp<GrTexture> GrD3D11Gpu::onWrapBackendTexture(const GrBackendTexture& tex,
                                                 GrWrapOwnership ownership,
                                                 GrWrapCacheable wrapType,
                                                 GrIOType ioType) {
    auto textureInfo = GrD3D11TextureInfo::getInfo(tex);

    if (!check_resource_info(textureInfo)) {
        return nullptr;
    }

    if (!check_tex_resource_info(this->d3d11Caps(), textureInfo)) {
        return nullptr;
    }

    // TODO: support protected context
    if (tex.isProtected()) {
        return nullptr;
    }

    return GrD3D11Texture::MakeWrappedTexture(
            this, tex.dimensions(), wrapType, ioType, textureInfo);
}

sk_sp<GrTexture> GrD3D11Gpu::onWrapCompressedBackendTexture(const GrBackendTexture& tex,
                                                           GrWrapOwnership ownership,
                                                           GrWrapCacheable wrapType) {
    return this->onWrapBackendTexture(tex, ownership, wrapType, kRead_GrIOType);
}

sk_sp<GrTexture> GrD3D11Gpu::onWrapRenderableBackendTexture(const GrBackendTexture& tex,
                                                           int sampleCnt,
                                                           GrWrapOwnership ownership,
                                                           GrWrapCacheable cacheable) {
    auto textureInfo = GrD3D11TextureInfo::getInfo(tex);

    if (!check_resource_info(textureInfo)) {
        return nullptr;
    }

    if (!check_tex_resource_info(this->d3d11Caps(), textureInfo)) {
        return nullptr;
    }
    if (!check_rt_resource_info(this->d3d11Caps(), textureInfo, sampleCnt)) {
        return nullptr;
    }

    // TODO: support protected context
    if (tex.isProtected()) {
        return nullptr;
    }

    sampleCnt = this->d3d11Caps().getRenderTargetSampleCount(sampleCnt, textureInfo.fFormat);

    return GrD3D11TextureRenderTarget::MakeWrappedTextureRenderTarget(
            this, tex.dimensions(), sampleCnt, cacheable, textureInfo);
}

sk_sp<GrRenderTarget> GrD3D11Gpu::onWrapBackendRenderTarget(const GrBackendRenderTarget& rt) {
    auto textureInfo = GrD3D11TextureInfo::getInfo(rt);

    if (!check_resource_info(textureInfo)) {
        return nullptr;
    }

    if (!check_rt_resource_info(this->d3d11Caps(), textureInfo, rt.sampleCnt())) {
        return nullptr;
    }

    // TODO: support protected context
    if (rt.isProtected()) {
        return nullptr;
    }

    sk_sp<GrD3D11RenderTarget> tgt = GrD3D11RenderTarget::MakeWrappedRenderTarget(
            this, rt.dimensions(), rt.sampleCnt(), textureInfo);

    // We don't allow the client to supply a premade stencil buffer. We always create one if needed.
    SkASSERT(!rt.stencilBits());
    if (tgt) {
        SkASSERT(tgt->canAttemptStencilAttachment(tgt->numSamples() > 1));
    }

    return std::move(tgt);
}

bool GrD3D11Gpu::onRegenerateMipMapLevels(GrTexture* tex) {
    auto* d3d11Tex = static_cast<GrD3D11Texture*>(tex);
    SkASSERT(tex->textureType() == GrTextureType::k2D);

    // determine if we can read from and mipmap this format
    const GrD3D11Caps& caps = this->d3d11Caps();
    if (!caps.isFormatTexturable(d3d11Tex->dxgiFormat()) || !caps.mipmapSupport()) {
        return false;
    }

    deviceContext()->GenerateMips(d3d11Tex->shaderResourceView());
    return true;
}

sk_sp<GrGpuBuffer> GrD3D11Gpu::onCreateBuffer(size_t sizeInBytes,
                                             GrGpuBufferType type,
                                             GrAccessPattern accessPattern) {
    return GrD3D11Buffer::Make(this, sizeInBytes, type, accessPattern);
}

sk_sp<GrAttachment> GrD3D11Gpu::makeStencilAttachment(const GrBackendFormat& /*colorFormat*/,
                                                     SkISize dimensions, int numStencilSamples) {
    DXGI_FORMAT sFmt = this->d3d11Caps().preferredStencilFormat();

    fStats.incStencilAttachmentCreates();
    return GrD3D11Attachment::MakeStencil(this, dimensions, numStencilSamples, sFmt);
}

bool GrD3D11Gpu::createTextureResourceForBackendSurface(DXGI_FORMAT dxgiFormat,
                                                      SkISize dimensions,
                                                      GrTexturable texturable,
                                                      GrRenderable renderable,
                                                      GrMipmapped mipmapped,
                                                      int sampleCnt,
                                                      GrD3D11TextureInfo* info,
                                                      GrProtected isProtected) {
    SkASSERT(texturable == GrTexturable::kYes || renderable == GrRenderable::kYes);

    D3D11_USAGE usage = D3D11_USAGE_DEFAULT;
    UINT bindFlags = D3D11_BIND_SHADER_RESOURCE;
    UINT cpuFlags = 0;
    UINT miscFlags = 0;

    if (this->protectedContext() != (isProtected == GrProtected::kYes)) {
        return false;
    }

    if (texturable == GrTexturable::kYes && !this->d3d11Caps().isFormatTexturable(dxgiFormat)) {
        return false;
    }

    if (renderable == GrRenderable::kYes) {
        if (!this->d3d11Caps().isFormatRenderable(dxgiFormat, 1)) {
            return false;
        }

        bindFlags |= D3D11_BIND_RENDER_TARGET;
    }

    int numMipLevels = 1;
    if (mipmapped == GrMipmapped::kYes) {
        numMipLevels = SkMipmap::ComputeLevelCount(dimensions.width(), dimensions.height()) + 1;
        miscFlags |= D3D11_RESOURCE_MISC_GENERATE_MIPS;
        bindFlags |= D3D11_BIND_RENDER_TARGET;
    }

    if (renderable == GrRenderable::kYes) {
        bindFlags |= D3D11_BIND_RENDER_TARGET;
    }

    D3D11_TEXTURE2D_DESC resourceDesc = {};
    resourceDesc.Width = dimensions.fWidth;
    resourceDesc.Height = dimensions.fHeight;
    resourceDesc.MipLevels = numMipLevels;
    resourceDesc.Format = dxgiFormat;
    resourceDesc.SampleDesc.Count = 1;
    resourceDesc.SampleDesc.Quality = 0;
    resourceDesc.Usage = usage;
    resourceDesc.BindFlags = bindFlags;
    resourceDesc.CPUAccessFlags = cpuFlags;
    resourceDesc.MiscFlags = miscFlags;
    resourceDesc.ArraySize = 1;

    info->fFormat = dxgiFormat;
    HRESULT hr = device()->CreateTexture2D(&resourceDesc, nullptr, &info->fTexture);
    GR_D3D_CALL_ERRCHECK(hr);

    info->fLevelCount = numMipLevels;
    info->fProtected = isProtected;
    info->fSampleCount = sampleCnt;

    return true;
}

GrBackendTexture GrD3D11Gpu::onCreateBackendTexture(SkISize dimensions,
                                                  const GrBackendFormat& format,
                                                  GrRenderable renderable,
                                                  GrMipmapped mipmapped,
                                                  GrProtected isProtected,
                                                  std::string_view label) {
    const GrD3D11Caps& caps = this->d3d11Caps();

    if (this->protectedContext() != (isProtected == GrProtected::kYes)) {
        return {};
    }

    DXGI_FORMAT dxgiFormat;
    if (!format.asDxgiFormat(&dxgiFormat)) {
        return {};
    }

    // TODO: move the texturability check up to GrGpu::createBackendTexture and just assert here
    if (!caps.isFormatTexturable(dxgiFormat)) {
        return {};
    }

    GrD3D11TextureInfo info;
    if (!this->createTextureResourceForBackendSurface(dxgiFormat,
                                                      dimensions,
                                                      GrTexturable::kYes,
                                                      renderable,
                                                      mipmapped,
                                                      1,
                                                      &info,
                                                      isProtected)) {
        return {};
    }

    return GrBackendTexture(dimensions.width(), dimensions.height(), info.toD3D12Info());
}

bool GrD3D11Gpu::onClearBackendTexture(const GrBackendTexture& backendTexture,
                                     sk_sp<skgpu::RefCntedCallback> finishedCallback,
                                     std::array<float, 4> color) {
    auto textureInfo = GrD3D11TextureInfo::getInfo(backendTexture);


    SkASSERT(!GrDxgiFormatIsCompressed(textureInfo.fFormat));
    
    backendTexture.dimensions();

    sk_sp<GrD3D11RenderTarget> renderTarget = GrD3D11RenderTarget::MakeWrappedRenderTarget(
            this, backendTexture.dimensions(), textureInfo.fSampleCount, textureInfo);

    deviceContext()->ClearRenderTargetView(renderTarget->colorRenderTargetView(), color.data());
    return true;
}

GrBackendTexture GrD3D11Gpu::onCreateCompressedBackendTexture(SkISize dimensions,
                                                            const GrBackendFormat& format,
                                                            GrMipmapped mipmapped,
                                                            GrProtected isProtected) {
    return this->onCreateBackendTexture(dimensions,
                                        format,
                                        GrRenderable::kNo,
                                        mipmapped,
                                        isProtected,
                                        /*label=*/"D3DGpu_CreateCompressedBackendTexture");

}

bool GrD3D11Gpu::onUpdateCompressedBackendTexture(const GrBackendTexture& backendTexture,
                                                sk_sp<skgpu::RefCntedCallback> finishedCallback,
                                                const void* data,
                                                size_t size) {
    auto textureInfo = GrD3D11TextureInfo::getInfo(backendTexture);

    SkISize dimensions = backendTexture.dimensions();

    ID3D11Texture2D* d3d11Resource = textureInfo.fTexture.get();
    SkASSERT(d3d11Resource);
    D3D11_TEXTURE2D_DESC desc;
    d3d11Resource->GetDesc(&desc);

    unsigned int mipLevelCount = 1;
    if (backendTexture.hasMipmaps()) {
        mipLevelCount = SkMipmap::ComputeLevelCount(dimensions.width(),
                                                    dimensions.height()) +
                        1;
    }

    SkIRect rect;
    rect.setXYWH(0, 0, dimensions.width(), dimensions.height());

    SkTextureCompressionType compressionType = GrBackendFormatToCompressionType(backendTexture.getBackendFormat());
    SkASSERT(size == SkCompressedFormatDataSize(compressionType,
                                                dimensions,
                                                backendTexture.mipmapped() == GrMipmapped::kYes));

    GrMipLevel mipLevels[32];

    const char* ptr = (const char*)data;
    for (unsigned int i = 0; i < mipLevelCount; ++i) {
        size_t levelDataSize =
                SkCompressedDataSize(compressionType, dimensions, nullptr, false);

        mipLevels[i].fPixels = ptr;
        mipLevels[i].fRowBytes = levelDataSize / dimensions.height();
        ptr += levelDataSize;
        dimensions = {std::max(1, dimensions.width() / 2), std::max(1, dimensions.height() / 2)};
    }

    return uploadToTexture(d3d11Resource, rect, mipLevels, mipLevelCount);
}

void GrD3D11Gpu::deleteBackendTexture(const GrBackendTexture& tex) {
    SkASSERT(GrBackendApi::kDirect3D == tex.backend());
    // Nothing to do here, will get cleaned up when the GrBackendTexture object goes away
}

bool GrD3D11Gpu::compile(const GrProgramDesc&, const GrProgramInfo&) { 
    return false; 
}

#if GR_TEST_UTILS
bool GrD3D11Gpu::isTestingOnlyBackendTexture(const GrBackendTexture& tex) const {
    SkASSERT(GrBackendApi::kDirect3D == tex.backend());

    auto textureInfo = GrD3D11TextureInfo::getInfo(tex);
    ID3D11Texture2D* d3d11Tex = textureInfo.fTexture.get();
    if (!d3d11Tex) 
        return false;

    D3D11_TEXTURE2D_DESC desc;
    d3d11Tex->GetDesc(&desc);
    return true;
}

GrBackendRenderTarget GrD3D11Gpu::createTestingOnlyBackendRenderTarget(SkISize dimensions,
                                                                      GrColorType colorType,
                                                                      int sampleCnt,
                                                                       GrProtected isProtected) {
    if (dimensions.width() > this->caps()->maxRenderTargetSize() ||
        dimensions.height() > this->caps()->maxRenderTargetSize()) {
        return {};
    }

    DXGI_FORMAT dxgiFormat = this->d3d11Caps().getFormatFromColorType(colorType);

    GrD3D11TextureInfo info;
    if (!this->createTextureResourceForBackendSurface(dxgiFormat,
                                                      dimensions,
                                                      GrTexturable::kNo,
                                                      GrRenderable::kYes,
                                                      GrMipmapped::kNo,
                                                      sampleCnt,
                                                      &info,
                                                      isProtected)) {
        return {};
    }

    return GrBackendRenderTarget(dimensions.width(), dimensions.height(), info.toD3D12Info());
}

void GrD3D11Gpu::deleteTestingOnlyBackendRenderTarget(const GrBackendRenderTarget& rt) {
    SkASSERT(GrBackendApi::kDirect3D == rt.backend());

    auto textureInfo = GrD3D11TextureInfo::getInfo(rt);
    if (textureInfo.fTexture.get()) {
        this->submitToGpu(true);
        // Nothing else to do here, will get cleaned up when the GrBackendRenderTarget
        // is deleted.
    }
}

void GrD3D11Gpu::testingOnly_startCapture() {
    if (fGraphicsAnalysis) {
        fGraphicsAnalysis->BeginCapture();
    }
}

void GrD3D11Gpu::testingOnly_stopCapture() {
    if (fGraphicsAnalysis) {
        fGraphicsAnalysis->EndCapture();
    }
}

#endif
