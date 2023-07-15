/*
 * Copyright 2017 Google Inc.
 *
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */

#ifndef GrD3D11Attachment_DEFINED
#define GrD3D11Attachment_DEFINED

#include "src/gpu/ganesh/GrAttachment.h"
#include "src/gpu/ganesh/GrBackendUtils.h"

class GrD3D11Gpu;
class GrD3D11Attachment : public GrAttachment {
public:
    static sk_sp<GrD3D11Attachment> MakeStencil(GrD3D11Gpu* gpu,
                                              SkISize dimensions,
                                              int sampleCnt,
                                              DXGI_FORMAT format);

    ~GrD3D11Attachment() override {}

    GrBackendFormat backendFormat() const override { return GrBackendFormat::MakeDxgi(fFormat); }

    const ID3D11View* view() const { return fView.get(); }

    DXGI_FORMAT dxgiFormat() const { return fInfo.fFormat; }

    ID3D11Texture2D* d3d11Resource() const { return fInfo.fTexture.get(); }

    const GrD3D11TextureInfo& getInfo() const { return fInfo; }

protected:
    void onRelease() override;
    void onAbandon() override;

private:
    GrD3D11Attachment(GrD3D11Gpu* gpu,
                    SkISize dimensions,
                    UsageFlags supportedUsages,
                    DXGI_FORMAT format,
                    const D3D11_TEXTURE2D_DESC&,
                    const GrD3D11TextureInfo&,
                    ID3D11View* view,
                    std::string_view label);

    GrD3D11Gpu* getD3D11Gpu() const;

    void onSetLabel() override;

    DXGI_FORMAT fFormat;
    gr_cp<ID3D11View> fView;
    GrD3D11TextureInfo fInfo;
};

#endif
