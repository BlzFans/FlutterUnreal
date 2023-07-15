/*
 * Copyright 2019 Google LLC
 *
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */

#include "include/gpu/d3d11/GrD3D11Types.h"

#include "include/gpu/GrBackendSurface.h"
#include "include/private/gpu/ganesh/GrD3D11TypesPriv.h"

GrBackendFormat GrD3D11TextureInfo::getBackendFormat() const {
    return GrBackendFormat::MakeDxgi(fFormat);
}

GrD3D11TextureInfo GrD3D11TextureInfo::getInfo(const GrBackendTexture& backend) {
    GrD3DTextureResourceInfo d3d12Info;
    backend.getD3DTextureResourceInfo(&d3d12Info);
    return GrD3D11TextureInfo(d3d12Info);
}

GrD3D11TextureInfo GrD3D11TextureInfo::getInfo(const GrBackendRenderTarget& backend) {
    GrD3DTextureResourceInfo d3d12Info;
    backend.getD3DTextureResourceInfo(&d3d12Info);
    return GrD3D11TextureInfo(d3d12Info);
}
