// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef FLUTTER_SHELL_GPU_GPU_SURFACE_D3D11_DELEGATE_H_
#define FLUTTER_SHELL_GPU_GPU_SURFACE_D3D11_DELEGATE_H_

#include "flutter/fml/memory/ref_ptr.h"
#include "flutter/shell/platform/embedder/embedder.h"
#include "third_party/skia/include/core/SkSize.h"

struct ID3D11Texture2D;

namespace flutter {

class GPUSurfaceD3D11Delegate {
 public:
  virtual ~GPUSurfaceD3D11Delegate() = default;

  virtual ID3D11Texture2D* AcquireImage(const SkISize& size) = 0;
  virtual bool Present() = 0;
};

}  // namespace flutter

#endif  // FLUTTER_SHELL_GPU_GPU_SURFACE_D3D11_DELEGATE_H_
