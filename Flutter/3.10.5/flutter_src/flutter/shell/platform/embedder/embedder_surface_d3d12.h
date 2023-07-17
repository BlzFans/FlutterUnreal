// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_EMBEDDER_EMBEDDER_SURFACE_D3D12_H_
#define FLUTTER_SHELL_PLATFORM_EMBEDDER_EMBEDDER_SURFACE_D3D12_H_

#include "flutter/fml/macros.h"
#include "flutter/shell/gpu/gpu_surface_d3d12.h"
#include "flutter/shell/platform/embedder/embedder_external_view_embedder.h"
#include "flutter/shell/platform/embedder/embedder_surface.h"
#include "shell/common/context_options.h"
#include "shell/gpu/gpu_surface_d3d12_delegate.h"
#include "shell/platform/embedder/embedder.h"

struct IDXGIAdapter1;
struct ID3D12Device;
struct ID3D12CommandQueue;

namespace flutter {

class EmbedderSurfaceD3D12 final : public EmbedderSurface,
                                    public GPUSurfaceD3D12Delegate {
 public:
  struct D3D12DispatchTable {
    std::function<ID3D12Resource*(const SkISize& frame_size)>
        get_back_buffer;  // required
    std::function<bool()>
        present;  // required
  };

  EmbedderSurfaceD3D12(
      IDXGIAdapter1* adapter,
      ID3D12Device* device,
      ID3D12CommandQueue* queue,
      const D3D12DispatchTable& d3d12_dispatch_table,
      std::shared_ptr<EmbedderExternalViewEmbedder> external_view_embedder);

  ~EmbedderSurfaceD3D12() override;

  // |GPUSurfaceD3D12Delegate|
  ID3D12Resource* AcquireImage(const SkISize& size) override;

  // |GPUSurfaceD3D11Delegate|
  bool Present() override;

 private:
  bool valid_ = false;
  IDXGIAdapter1* adapter_;
  ID3D12Device* device_;
  ID3D12CommandQueue* queue_;
  D3D12DispatchTable d3d12_dispatch_table_;
  std::shared_ptr<EmbedderExternalViewEmbedder> external_view_embedder_;
  sk_sp<GrDirectContext> main_context_;
  sk_sp<GrDirectContext> resource_context_;

  // |EmbedderSurface|
  bool IsValid() const override;

  // |EmbedderSurface|
  std::unique_ptr<Surface> CreateGPUSurface() override;

  // |EmbedderSurface|
  sk_sp<GrDirectContext> CreateResourceContext() const override;

  sk_sp<GrDirectContext> CreateGrContext(IDXGIAdapter1* adapter, 
                                         ID3D12Device* device,
                                         ID3D12CommandQueue* queue,
                                         ContextType context_type) const;

  FML_DISALLOW_COPY_AND_ASSIGN(EmbedderSurfaceD3D12);
};

}  // namespace flutter

#endif  // FLUTTER_SHELL_PLATFORM_EMBEDDER_EMBEDDER_SURFACE_D3D12_H_
