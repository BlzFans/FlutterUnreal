
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "flutter/shell/platform/embedder/embedder_surface_d3d12.h"

#include <utility>

#include "flutter/shell/common/shell_io_manager.h"
#include "include/gpu/GrDirectContext.h"
#include "shell/gpu/gpu_surface_d3d12.h"
#include "shell/gpu/gpu_surface_d3d12_delegate.h"

#include "third_party/skia/include/gpu/GrDirectContext.h"
#include "third_party/skia/include/gpu/GrBackendSurface.h"
#include "third_party/skia/include/gpu/d3d/GrD3DBackendContext.h"

namespace flutter {

EmbedderSurfaceD3D12::EmbedderSurfaceD3D12(
    IDXGIAdapter1* adapter,
    ID3D12Device* device,
    ID3D12CommandQueue* queue,
    const D3D12DispatchTable& d3d12_dispatch_table,
    std::shared_ptr<EmbedderExternalViewEmbedder> external_view_embedder)
    : adapter_(adapter),
      device_(device),
      queue_(queue),
      d3d12_dispatch_table_(d3d12_dispatch_table),
      external_view_embedder_(std::move(external_view_embedder)) {
  main_context_ = CreateGrContext(adapter, device, queue, ContextType::kRender);
  // TODO(96954): Add a second (optional) queue+family index to the Embedder API
  //              to allow embedders to specify a dedicated transfer queue for
  //              use by the resource context. Queue families with graphics
  //              capability can always be used for memory transferring, but it
  //              would be advantageous to use a dedicated transter queue here.
  //resource_context_ = CreateGrContext(adapter, device, queue, ContextType::kResource);
  //valid_ = main_context_ && resource_context_;
  valid_ = main_context_ ? true : false;
}

EmbedderSurfaceD3D12::~EmbedderSurfaceD3D12() {
  if (main_context_) {
    main_context_->releaseResourcesAndAbandonContext();
  }
  if (resource_context_) {
    resource_context_->releaseResourcesAndAbandonContext();
  }
}

// |GPUSurfaceD3D12Delegate|
ID3D12Resource* EmbedderSurfaceD3D12::AcquireImage(const SkISize& size) {
  return d3d12_dispatch_table_.get_back_buffer(size);
}

// |GPUSurfaceD3D12Delegate|
bool EmbedderSurfaceD3D12::Present() {
  return d3d12_dispatch_table_.present();
}

// |EmbedderSurface|
bool EmbedderSurfaceD3D12::IsValid() const {
  return valid_;
}

// |EmbedderSurface|
std::unique_ptr<Surface> EmbedderSurfaceD3D12::CreateGPUSurface() {
  const bool render_to_surface = !external_view_embedder_;
  return std::make_unique<GPUSurfaceD3D12>(this, main_context_,
                                            render_to_surface);
}

// |EmbedderSurface|
sk_sp<GrDirectContext> EmbedderSurfaceD3D12::CreateResourceContext() const {
  return resource_context_;
}

sk_sp<GrDirectContext> EmbedderSurfaceD3D12::CreateGrContext(
    IDXGIAdapter1* adapter,
    ID3D12Device* device,
    ID3D12CommandQueue* queue,
    ContextType context_type) const {

  GrD3DBackendContext backendContext;
  backendContext.fAdapter.retain(adapter);
  backendContext.fDevice.retain(device);
  backendContext.fQueue.retain(queue);

  GrContextOptions options =
      MakeDefaultContextOptions(context_type, GrBackendApi::kDirect3D);
  options.fReduceOpsTaskSplitting = GrContextOptions::Enable::kNo;

  return GrDirectContext::MakeDirect3D(backendContext, options);
}

}  // namespace flutter
