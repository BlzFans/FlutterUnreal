/*
 * Copyright 2017 Google Inc.
 *
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */
#ifndef GrD3D11Texture_DEFINED
#define GrD3D11Texture_DEFINED

#include "include/gpu/ganesh/SkImageGanesh.h"
#include "include/gpu/d3d11/GrD3D11Types.h"
#include "src/gpu/ganesh/GrAttachment.h"
#include "src/gpu/ganesh/GrTexture.h"
#include "src/gpu/ganesh/GrBackendUtils.h"
#include "src/gpu/ganesh/d3d11/GrD3D11Gpu.h"

class GrD3D11Texture : public GrTexture {
public:
    static sk_sp<GrD3D11Texture> MakeNewTexture(GrD3D11Gpu*,
                                              skgpu::Budgeted,
                                              SkISize dimensions,
                                              const D3D11_TEXTURE2D_DESC&,
                                              GrProtected,
                                              GrMipmapStatus,
                                              std::string_view label);

    static sk_sp<GrD3D11Texture> MakeWrappedTexture(GrD3D11Gpu*,
                                                  SkISize dimensions,
                                                  GrWrapCacheable,
                                                  GrIOType,
                                                  const GrD3D11TextureInfo&);

    ~GrD3D11Texture() override {}

    GrBackendTexture getBackendTexture() const override;

    GrBackendFormat backendFormat() const override {
        return fInfo.getBackendFormat();
    }

    ID3D11ShaderResourceView* shaderResourceView() { return fShaderResourceView; }

    void textureParamsModified() override {}

    DXGI_FORMAT dxgiFormat() const { return fInfo.fFormat; }

    ID3D11Texture2D* d3d11Resource() const { 
        return fInfo.fTexture.get();
    }

    const GrD3D11TextureInfo& getInfo() const { 
        return fInfo; 
    }

protected:
    GrD3D11Texture(GrD3D11Gpu*,
                 SkISize dimensions,
                 const GrD3D11TextureInfo&,
                 ID3D11ShaderResourceView* shaderResourceView,
                 GrMipmapStatus,
                 std::string_view label);

    GrD3D11Gpu* getD3D11Gpu() const;

    void onRelease() override;
    void onAbandon() override;

    void releaseResource(GrD3D11Gpu* gpu);

    bool onStealBackendTexture(GrBackendTexture*, SkImages::BackendTextureReleaseProc*) override {
        return false;
    }

    void onSetLabel() override;

private:
    GrD3D11Texture(GrD3D11Gpu*,
                 skgpu::Budgeted,
                 SkISize dimensions,
                 const GrD3D11TextureInfo&,
                 ID3D11ShaderResourceView* shaderResourceView,
                 GrMipmapStatus,
                 std::string_view label);
    GrD3D11Texture(GrD3D11Gpu*,
                 SkISize dimensions,
                 const GrD3D11TextureInfo&,
                 ID3D11ShaderResourceView* shaderResourceView,
                 GrMipmapStatus,
                 GrWrapCacheable,
                 GrIOType,
                 std::string_view label);

    ID3D11ShaderResourceView* fShaderResourceView;
    GrD3D11TextureInfo fInfo;

    using INHERITED = GrTexture;
};

#endif
