// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "flutter/shell/gpu/gpu_surface_d3d11.h"

#include "flutter/fml/logging.h"
#include "fml/trace_event.h"
#include "include/core/SkColorSpace.h"
#include "include/core/SkSize.h"

#include "third_party/skia/include/gpu/GrDirectContext.h"
#include "third_party/skia/include/gpu/GrBackendSurface.h"
#include "third_party/skia/include/gpu/d3d11/GrD3D11Types.h"

namespace flutter {

GPUSurfaceD3D11::GPUSurfaceD3D11(GPUSurfaceD3D11Delegate* delegate,
                                   const sk_sp<GrDirectContext>& skia_context,
                                   bool render_to_surface)
    : delegate_(delegate),
      skia_context_(skia_context),
      render_to_surface_(render_to_surface),
      weak_factory_(this)
      {}

GPUSurfaceD3D11::~GPUSurfaceD3D11() = default;

bool GPUSurfaceD3D11::IsValid() {
  return skia_context_ != nullptr;
}

std::unique_ptr<SurfaceFrame> GPUSurfaceD3D11::AcquireFrame(
    const SkISize& frame_size) {
  if (!IsValid()) {
    FML_LOG(ERROR) << "D3D11 surface was invalid.";
    return nullptr;
  }

  if (frame_size.isEmpty()) {
    FML_LOG(ERROR) << "D3D11 surface was asked for an empty frame.";
    return nullptr;
  }

  if (!render_to_surface_) {
    return std::make_unique<SurfaceFrame>(
        nullptr, SurfaceFrame::FramebufferInfo(),
        [](const SurfaceFrame& surface_frame, DlCanvas* canvas) {
          return true;
        },
        frame_size);
  }

  ID3D11Texture2D* backBuffer = delegate_->AcquireImage(frame_size);
  if (!backBuffer) {
    FML_LOG(ERROR) << "Invalid back buffer given by the embedder.";
    return nullptr;
  }

  sk_sp<SkSurface> surface = CreateSurfaceFromD3D11Texture(backBuffer, frame_size);

  if (!surface) {
    FML_LOG(ERROR) << "Could not create the SkSurface from the image.";
    return nullptr;
  }

  SurfaceFrame::SubmitCallback callback =
      [delegate = delegate_](const SurfaceFrame&, DlCanvas* canvas) -> bool {
    TRACE_EVENT0("flutter", "GPUSurfaceD3D11::Present");
    if (canvas == nullptr) {
      FML_DLOG(ERROR) << "Canvas not available.";
      return false;
    }

    canvas->Flush();
    return delegate->Present();
  };

  SurfaceFrame::FramebufferInfo framebuffer_info{.supports_readback = true};

  return std::make_unique<SurfaceFrame>(surface, framebuffer_info,
                                        std::move(callback), frame_size);
}

SkMatrix GPUSurfaceD3D11::GetRootTransformation() const {
  // This backend does not support delegating to the underlying platform to
  // query for root surface transformations. Just return identity.
  SkMatrix matrix;
  matrix.reset();
  return matrix;
}

GrDirectContext* GPUSurfaceD3D11::GetContext() {
  return skia_context_.get();
}

static SkColorType ColorTypeFromFormat(const DXGI_FORMAT format) {
  switch (format) {
    case DXGI_FORMAT_R8G8B8A8_UNORM:
    case DXGI_FORMAT_R8G8B8A8_UNORM_SRGB:
      return SkColorType::kRGBA_8888_SkColorType;
    case DXGI_FORMAT_B8G8R8A8_UNORM:
    case DXGI_FORMAT_B8G8R8A8_UNORM_SRGB:
      return SkColorType::kBGRA_8888_SkColorType;

    case DXGI_FORMAT_R10G10B10A2_UNORM:
      return SkColorType::kRGBA_1010102_SkColorType;

    case DXGI_FORMAT_R16G16B16A16_FLOAT: 
        return SkColorType::kRGBA_F16_SkColorType;

    default:
      return SkColorType::kUnknown_SkColorType;
  }
}

sk_sp<SkSurface> GPUSurfaceD3D11::CreateSurfaceFromD3D11Texture(
    ID3D11Texture2D* texture,
    const SkISize& size) {
  
  D3D11_TEXTURE2D_DESC desc;
  texture->GetDesc(&desc);

  GrD3D11TextureInfo textureInfo{};
  textureInfo.fFormat = desc.Format;
  textureInfo.fTexture.retain(texture);
  textureInfo.fSampleCount = 1;
  textureInfo.fLevelCount = 1;

  GrBackendRenderTarget backendRT(size.width(), size.height(),
                                  textureInfo.toD3D12Info());
  SkSurfaceProps surface_properties(0, kUnknown_SkPixelGeometry);
  return SkSurface::MakeFromBackendRenderTarget(
      skia_context_.get(), backendRT, kTopLeft_GrSurfaceOrigin,
      ColorTypeFromFormat(desc.Format), SkColorSpace::MakeSRGB(),
      &surface_properties);
}

}  // namespace flutter
