/*
 * Copyright 2017 Google Inc.
 *
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */

#ifndef GrD3D11Types_DEFINED
#define GrD3D11Types_DEFINED

#include "include/gpu/GrTypes.h"
#include "include/private/gpu/ganesh/GrTypesPriv.h"
#include "include/gpu/d3d/GrD3DTypes.h"

#include <d3d11.h>

class GrBackendFormat;
class GrBackendTexture;
class GrBackendRenderTarget;

struct GrD3D11TextureInfo {
    GrD3D11TextureInfo() = default;
    explicit GrD3D11TextureInfo(const GrD3DTextureResourceInfo& info) {
        fLevelCount = info.fLevelCount;
        fSampleCount = info.fSampleCount;
        fProtected = info.fProtected;
        fFormat = info.fFormat;
        fTexture.retain((ID3D11Texture2D*)info.fResource.get());
    }

    GrD3DTextureResourceInfo toD3D12Info() const {
        GrD3DTextureResourceInfo d3d12Info;
        d3d12Info.fLevelCount = fLevelCount;
        d3d12Info.fSampleCount = fSampleCount;
        d3d12Info.fProtected = fProtected;
        d3d12Info.fFormat = fFormat;
        d3d12Info.fResource.retain((ID3D12Resource*)fTexture.get());
        return d3d12Info;
    }

    static GrD3D11TextureInfo getInfo(const GrBackendTexture& backend);
    static GrD3D11TextureInfo getInfo(const GrBackendRenderTarget& backend);

    GrBackendFormat getBackendFormat() const;

    uint32_t fLevelCount = 1;
    uint32_t fSampleCount = 1;
    GrProtected fProtected = GrProtected::kNo;
    DXGI_FORMAT fFormat = DXGI_FORMAT::DXGI_FORMAT_UNKNOWN;
    gr_cp<ID3D11Texture2D> fTexture;
};

struct GrD3D11SurfaceInfo {
    uint32_t fSampleCount = 1;
    uint32_t fLevelCount = 0;
    GrProtected fProtected = GrProtected::kNo;

    DXGI_FORMAT fFormat = DXGI_FORMAT_UNKNOWN;
    unsigned int fSampleQualityPattern = DXGI_STANDARD_MULTISAMPLE_QUALITY_PATTERN;
};

#endif
