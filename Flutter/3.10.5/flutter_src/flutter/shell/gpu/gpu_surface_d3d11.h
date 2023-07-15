// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef SHELL_GPU_GPU_SURFACE_D3D11_H_
#define SHELL_GPU_GPU_SURFACE_D3D11_H_

#include <memory>

#include "flutter/flow/surface.h"
#include "flutter/fml/macros.h"
#include "flutter/fml/memory/weak_ptr.h"
#include "flutter/shell/gpu/gpu_surface_d3d11_delegate.h"
#include "include/core/SkRefCnt.h"

namespace flutter {

class GPUSurfaceD3D11 : public Surface {
 public:
  GPUSurfaceD3D11(GPUSurfaceD3D11Delegate* delegate,
                   const sk_sp<GrDirectContext>& context,
                   bool render_to_surface);

  ~GPUSurfaceD3D11() override;

  // |Surface|
  bool IsValid() override;

  // |Surface|
  std::unique_ptr<SurfaceFrame> AcquireFrame(const SkISize& size) override;

  // |Surface|
  SkMatrix GetRootTransformation() const override;

  // |Surface|
  GrDirectContext* GetContext() override;

 private:
  GPUSurfaceD3D11Delegate* delegate_;
  sk_sp<GrDirectContext> skia_context_;
  bool render_to_surface_;

  fml::WeakPtrFactory<GPUSurfaceD3D11> weak_factory_;
  sk_sp<SkSurface> CreateSurfaceFromD3D11Texture(
    ID3D11Texture2D* texture,
    const SkISize& size);

  FML_DISALLOW_COPY_AND_ASSIGN(GPUSurfaceD3D11);
};

}  // namespace flutter

#endif  // SHELL_GPU_GPU_SURFACE_D3D11_H_
