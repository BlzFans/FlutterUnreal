// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_PLATFORM_EMBEDDER_EMBEDDER_SURFACE_D3D11_H_
#define FLUTTER_SHELL_PLATFORM_EMBEDDER_EMBEDDER_SURFACE_D3D11_H_

#include "flutter/fml/macros.h"
#include "flutter/shell/gpu/gpu_surface_d3d11.h"
#include "flutter/shell/platform/embedder/embedder_external_view_embedder.h"
#include "flutter/shell/platform/embedder/embedder_surface.h"
#include "shell/common/context_options.h"
#include "shell/gpu/gpu_surface_d3d11_delegate.h"
#include "shell/platform/embedder/embedder.h"

struct ID3D11Device;
struct ID3D11DeviceContext;
struct IDXGIAdapter1;

namespace flutter {

class EmbedderSurfaceD3D11 final : public EmbedderSurface,
                                    public GPUSurfaceD3D11Delegate {
 public:
  struct D3D11DispatchTable {
    std::function<ID3D11Texture2D* (const SkISize& frame_size)>
        get_back_buffer;  // required
    std::function<bool()>
        present;  // required
  };

  EmbedderSurfaceD3D11(
      ID3D11Device* device,
      ID3D11DeviceContext* deviceContext,
      const D3D11DispatchTable& d3d11_dispatch_table,
      std::shared_ptr<EmbedderExternalViewEmbedder> external_view_embedder);

  ~EmbedderSurfaceD3D11() override;

  // |GPUSurfaceD3D11Delegate|
  ID3D11Texture2D* AcquireImage(const SkISize& size) override;

  // |GPUSurfaceD3D11Delegate|
  bool Present() override;

 private:
  bool valid_ = false;
  ID3D11Device* device_;
  ID3D11DeviceContext* deviceContext_;
  D3D11DispatchTable d3d11_dispatch_table_;
  std::shared_ptr<EmbedderExternalViewEmbedder> external_view_embedder_;
  sk_sp<GrDirectContext> main_context_;
  sk_sp<GrDirectContext> resource_context_;

  // |EmbedderSurface|
  bool IsValid() const override;

  // |EmbedderSurface|
  std::unique_ptr<Surface> CreateGPUSurface() override;

  // |EmbedderSurface|
  sk_sp<GrDirectContext> CreateResourceContext() const override;

  sk_sp<GrDirectContext> CreateGrContext(ID3D11Device* device,
                                         ID3D11DeviceContext* deviceContext,
                                         ContextType context_type) const;

  FML_DISALLOW_COPY_AND_ASSIGN(EmbedderSurfaceD3D11);
};

}  // namespace flutter

#endif  // FLUTTER_SHELL_PLATFORM_EMBEDDER_EMBEDDER_SURFACE_D3D11_H_
