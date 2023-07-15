/*
 * Copyright 2017 Google Inc.
 *
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */

#ifndef GrD3D11OpsRenderPass_DEFINED
#define GrD3D11OpsRenderPass_DEFINED

#include "src/gpu/ganesh/GrOpsRenderPass.h"

#include "src/gpu/ganesh/GrTexture.h"

class GrD3D11Gpu;
struct GrD3D11Program;

class GrD3D11OpsRenderPass : public GrOpsRenderPass {
public:
    GrD3D11OpsRenderPass(GrD3D11Gpu* gpu);

    ~GrD3D11OpsRenderPass() override;

    void inlineUpload(GrOpFlushState* state, GrDeferredTextureUploadFn& upload) override;

    void onExecuteDrawable(std::unique_ptr<SkDrawable::GpuDrawHandler>) override {}

    bool set(GrRenderTarget*,
             GrSurfaceOrigin,
             const SkIRect& bounds,
             const GrOpsRenderPass::LoadAndStoreInfo&,
             const GrOpsRenderPass::StencilLoadAndStoreInfo&,
             const skia_private::TArray<GrSurfaceProxy*, true>& sampledProxies);

    void submit();

private:
    GrGpu* gpu() override;

    void onBegin() override;

    bool onBindPipeline(const GrProgramInfo&, const SkRect& drawBounds) override;
    void onSetScissorRect(const SkIRect&) override;
    bool onBindTextures(const GrGeometryProcessor&,
                        const GrSurfaceProxy* const geomProcTextures[],
                        const GrPipeline&) override;
    void onBindBuffers(sk_sp<const GrBuffer> indexBuffer, sk_sp<const GrBuffer> instanceBuffer,
                       sk_sp<const GrBuffer> vertexBuffer, GrPrimitiveRestart) override;
    void onDraw(int vertexCount, int baseVertex) override {
        this->onDrawInstanced(1, 0, vertexCount, baseVertex);
    }
    void onDrawIndexed(int indexCount, int baseIndex, uint16_t minIndexValue,
                       uint16_t maxIndexValue, int baseVertex) override {
        this->onDrawIndexedInstanced(indexCount, baseIndex, 1, 0, baseVertex);
    }
    void onDrawInstanced(int instanceCount, int baseInstance, int vertexCount,
                         int baseVertex) override;
    void onDrawIndexedInstanced(int indexCount, int baseIndex, int instanceCount, int baseInstance,
                                int baseVertex) override;

    void onClear(const GrScissorState& scissor, std::array<float, 4> color) override;

    void onClearStencilClip(const GrScissorState& scissor, bool insideStencilMask) override;

    GrD3D11Gpu* fGpu;

    SkIRect fBounds;
    SkIRect fCurrentPipelineBounds;

    GrLoadOp fColorLoadOp;
    std::array<float, 4> fClearColor;
    GrLoadOp fStencilLoadOp;

    GrD3D11Program* fCurrentProgram = nullptr;

    using INHERITED = GrOpsRenderPass;
};

#endif
