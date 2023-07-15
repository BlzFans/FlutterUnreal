
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "flutter/shell/platform/embedder/embedder_surface_d3d11.h"

#include <utility>

#include "flutter/shell/common/shell_io_manager.h"
#include "include/gpu/GrDirectContext.h"
#include "shell/gpu/gpu_surface_d3d11.h"
#include "shell/gpu/gpu_surface_d3d11_delegate.h"

#include "third_party/skia/include/gpu/GrDirectContext.h"
#include "third_party/skia/include/gpu/GrBackendSurface.h"
#include "third_party/skia/include/gpu/d3d11/GrD3D11Types.h"
#include "third_party/skia/include/gpu/d3d/GrD3DBackendContext.h"

namespace flutter {

EmbedderSurfaceD3D11::EmbedderSurfaceD3D11(
    ID3D11Device* device,
    ID3D11DeviceContext* deviceContext,
    const D3D11DispatchTable& d3d11_dispatch_table,
    std::shared_ptr<EmbedderExternalViewEmbedder> external_view_embedder)
    : device_(device),
      deviceContext_(deviceContext),
      d3d11_dispatch_table_(d3d11_dispatch_table),
      external_view_embedder_(std::move(external_view_embedder)) {
  main_context_ = CreateGrContext(device, deviceContext, ContextType::kRender);
  // TODO(96954): Add a second (optional) queue+family index to the Embedder API
  //              to allow embedders to specify a dedicated transfer queue for
  //              use by the resource context. Queue families with graphics
  //              capability can always be used for memory transferring, but it
  //              would be advantageous to use a dedicated transter queue here.
  //resource_context_ = CreateGrContext(device, deviceContext, ContextType::kResource);
  //valid_ = main_context_ && resource_context_;
  valid_ = main_context_ ? true : false;
}

EmbedderSurfaceD3D11::~EmbedderSurfaceD3D11() {
  if (main_context_) {
    main_context_->releaseResourcesAndAbandonContext();
  }
  if (resource_context_) {
    resource_context_->releaseResourcesAndAbandonContext();
  }
}

// |GPUSurfaceD3D11Delegate|
ID3D11Texture2D* EmbedderSurfaceD3D11::AcquireImage(const SkISize& size) {
  return d3d11_dispatch_table_.get_back_buffer(size);
}

// |GPUSurfaceD3D11Delegate|
bool EmbedderSurfaceD3D11::Present() {
  return d3d11_dispatch_table_.present();
}

// |EmbedderSurface|
bool EmbedderSurfaceD3D11::IsValid() const {
  return valid_;
}

// |EmbedderSurface|
std::unique_ptr<Surface> EmbedderSurfaceD3D11::CreateGPUSurface() {
  const bool render_to_surface = !external_view_embedder_;
  return std::make_unique<GPUSurfaceD3D11>(this, main_context_,
                                            render_to_surface);
}

// |EmbedderSurface|
sk_sp<GrDirectContext> EmbedderSurfaceD3D11::CreateResourceContext() const {
  return resource_context_;
}

sk_sp<GrDirectContext> EmbedderSurfaceD3D11::CreateGrContext(
    ID3D11Device* device,
    ID3D11DeviceContext* deviceContext,
    ContextType context_type) const {

  GrD3DBackendContext backendContext;
  backendContext.fD3D11Device = device;
  backendContext.fD3D11DeviceContext = deviceContext;

  GrContextOptions options =
      MakeDefaultContextOptions(context_type, GrBackendApi::kDirect3D);
  options.fReduceOpsTaskSplitting = GrContextOptions::Enable::kNo;

  return GrDirectContext::MakeDirect3D(backendContext, options);
}

}  // namespace flutter
