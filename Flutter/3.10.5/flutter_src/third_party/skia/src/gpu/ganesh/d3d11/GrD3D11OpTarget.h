/*
 * Copyright 2020 Google Inc.
 *
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */

#ifndef GrD3D11OpTarget_DEFINED
#define GrD3D11OpTarget_DEFINED

#include "include/gpu/GrDirectContext.h"
#include "src/gpu/ganesh/GrAppliedClip.h"
#include "src/gpu/ganesh/GrDirectContextPriv.h"
#include "src/gpu/ganesh/GrDstProxyView.h"
#include "src/gpu/ganesh/GrGpu.h"
#include "src/gpu/ganesh/GrMeshDrawTarget.h"

// This is a d3d11 GrMeshDrawTarget implementation that just gives back pointers into
// pre-allocated CPU buffers, rather than allocating and mapping GPU buffers.
class GrD3D11OpTarget : public GrMeshDrawTarget {
public:
    GrD3D11OpTarget(sk_sp<GrDirectContext> d3d11Context) : fD3D11Context(std::move(d3d11Context)) {
        fStaticVertexBuffer = fD3D11Context->priv().getGpu()->createBuffer(
                sizeof(fStaticVertexData), GrGpuBufferType::kVertex, kDynamic_GrAccessPattern);
        fStaticIndirectBuffer = fD3D11Context->priv().getGpu()->createBuffer(
                sizeof(fStaticIndirectData), GrGpuBufferType::kDrawIndirect,
                kDynamic_GrAccessPattern);
    }
    const GrDirectContext* d3d11Context() const { return fD3D11Context.get(); }
    const GrCaps& caps() const override { return *fD3D11Context->priv().caps(); }
    GrThreadSafeCache* threadSafeCache() const override {
        return fD3D11Context->priv().threadSafeCache();
    }
    GrResourceProvider* resourceProvider() const override {
        return fD3D11Context->priv().resourceProvider();
    }
#ifndef SK_ENABLE_OPTIMIZE_SIZE
    skgpu::v1::SmallPathAtlasMgr* smallPathAtlasManager() const override { return nullptr; }
#endif
    void resetAllocator() { fAllocator.reset(); }
    SkArenaAlloc* allocator() override { return &fAllocator; }
    void putBackVertices(int vertices, size_t vertexStride) override { /* no-op */ }
    GrAppliedClip detachAppliedClip() override { return GrAppliedClip::Disabled(); }
    const GrDstProxyView& dstProxyView() const override { return fDstProxyView; }
    GrXferBarrierFlags renderPassBarriers() const override { return GrXferBarrierFlags::kNone; }
    GrLoadOp colorLoadOp() const override { return GrLoadOp::kLoad; }

    void* makeVertexSpace(size_t vertexSize, int vertexCount, sk_sp<const GrBuffer>* buffer,
                          int* startVertex) override {
        if (vertexSize * vertexCount > sizeof(fStaticVertexData)) {
            SK_ABORT("FATAL: wanted %zu bytes of static vertex data; only have %zu.\n",
                     vertexSize * vertexCount, sizeof(fStaticVertexData));
        }
        *buffer = fStaticVertexBuffer;
        *startVertex = 0;
        return fStaticVertexData;
    }

    void* makeVertexSpaceAtLeast(size_t vertexSize, int minVertexCount, int fallbackVertexCount,
                                 sk_sp<const GrBuffer>* buffer, int* startVertex,
                                 int* actualVertexCount) override {
        if (vertexSize * minVertexCount > sizeof(fStaticVertexData)) {
            SK_ABORT("FATAL: wanted %zu bytes of static vertex data; only have %zu.\n",
                     vertexSize * minVertexCount, sizeof(fStaticVertexData));
        }
        *buffer = fStaticVertexBuffer;
        *startVertex = 0;
        *actualVertexCount = sizeof(fStaticVertexData) / vertexSize;
        return fStaticVertexData;
    }

    GrDrawIndirectWriter makeDrawIndirectSpace(int drawCount, sk_sp<const GrBuffer>* buffer,
                                               size_t* offsetInBytes) override {
        if (sizeof(GrDrawIndirectCommand) * drawCount > sizeof(fStaticIndirectData)) {
            SK_ABORT("FATAL: wanted %zu bytes of static indirect data; only have %zu.\n",
                     sizeof(GrDrawIndirectCommand) * drawCount, sizeof(fStaticIndirectData));
        }
        *buffer = fStaticIndirectBuffer;
        *offsetInBytes = 0;
        return fStaticIndirectData;
    }

    void putBackIndirectDraws(int count) override { /* no-op */ }

    GrDrawIndexedIndirectWriter makeDrawIndexedIndirectSpace(int drawCount,
                                                             sk_sp<const GrBuffer>* buffer,
                                                             size_t* offsetInBytes) override {
        if (sizeof(GrDrawIndexedIndirectCommand) * drawCount > sizeof(fStaticIndirectData)) {
            SK_ABORT("FATAL: wanted %zu bytes of static indirect data; only have %zu.\n",
                     sizeof(GrDrawIndexedIndirectCommand) * drawCount, sizeof(fStaticIndirectData));
        }
        *buffer = fStaticIndirectBuffer;
        *offsetInBytes = 0;
        return fStaticIndirectData;
    }

    void putBackIndexedIndirectDraws(int count) override { /* no-op */ }

    // Call these methods to see what got written after the previous call to make*Space.
    const void* peekStaticVertexData() const { return fStaticVertexData; }
    const void* peekStaticIndirectData() const { return fStaticIndirectData; }

#define UNIMPL(...) __VA_ARGS__ override { SK_ABORT("unimplemented."); }
    UNIMPL(void recordDraw(const GrGeometryProcessor*, const GrSimpleMesh[], int,
                           const GrSurfaceProxy* const[], GrPrimitiveType))
    UNIMPL(uint16_t* makeIndexSpace(int, sk_sp<const GrBuffer>*, int*))
    UNIMPL(uint16_t* makeIndexSpaceAtLeast(int, int, sk_sp<const GrBuffer>*, int*, int*))
    UNIMPL(void putBackIndices(int))
    UNIMPL(GrRenderTargetProxy* rtProxy() const)
    UNIMPL(const GrSurfaceProxyView& writeView() const)
    UNIMPL(const GrAppliedClip* appliedClip() const)
    UNIMPL(bool usesMSAASurface() const)
    UNIMPL(sktext::gpu::StrikeCache* strikeCache() const)
    UNIMPL(GrAtlasManager* atlasManager() const)
    UNIMPL(SkTArray<GrSurfaceProxy*, true>* sampledProxyArray())
    UNIMPL(GrDeferredUploadTarget* deferredUploadTarget())
#undef UNIMPL

private:
    sk_sp<GrDirectContext> fD3D11Context;
    char fStaticVertexData[6 * 1024 * 1024];
    sk_sp<GrGpuBuffer> fStaticVertexBuffer;
    char fStaticIndirectData[sizeof(GrDrawIndexedIndirectCommand) * 32];
    sk_sp<GrGpuBuffer> fStaticIndirectBuffer;
    SkSTArenaAllocWithReset<1024 * 1024> fAllocator;
    GrDstProxyView fDstProxyView;
};

#endif
