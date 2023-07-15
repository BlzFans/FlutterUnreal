
#include "src/gpu/ganesh/d3d11/GrD3D11Gpu.h"
#include "src/gpu/ganesh/d3d11/GrD3D11Attachment.h"

GrD3D11Attachment::GrD3D11Attachment(GrD3D11Gpu* gpu,
                                 SkISize dimensions,
                                 UsageFlags supportedUsages,
                                 DXGI_FORMAT format,
                                 const D3D11_TEXTURE2D_DESC& desc,
                                 const GrD3D11TextureInfo& info,
                                 ID3D11View* view,
                                 std::string_view label)
        : GrAttachment(gpu,
                       dimensions,
                       supportedUsages,
                       desc.SampleDesc.Count,
                       GrMipmapped::kNo,
                       GrProtected::kNo,
                       label)
        , fFormat(format)
        , fView(view)
        , fInfo(info) {
    this->registerWithCache(skgpu::Budgeted::kYes);
}

sk_sp<GrD3D11Attachment> GrD3D11Attachment::MakeStencil(GrD3D11Gpu* gpu,
                                                    SkISize dimensions,
                                                    int sampleCnt,
                                                    DXGI_FORMAT format) {
    HRESULT hr;

    D3D11_USAGE usage = D3D11_USAGE_DEFAULT;
    UINT bindFlags = 0;
    UINT cpuFlags = 0;
    UINT miscFlags = 0;

    bindFlags |= D3D11_BIND_DEPTH_STENCIL;

    D3D11_TEXTURE2D_DESC desc = {};
    desc.Width = dimensions.fWidth;
    desc.Height = dimensions.fHeight;
    desc.MipLevels = 1;
    desc.Format = format;
    desc.SampleDesc.Count = 1;
    desc.SampleDesc.Quality = 0;
    desc.Usage = usage;
    desc.BindFlags = bindFlags;
    desc.CPUAccessFlags = cpuFlags;
    desc.MiscFlags = miscFlags;
    desc.ArraySize = 1;

    GrD3D11TextureInfo info;
    info.fFormat = format;
    info.fLevelCount = 1;
    hr = gpu->device()->CreateTexture2D(&desc, nullptr, &info.fTexture);
    GR_D3D_CALL_ERRCHECK(hr);

    ID3D11DepthStencilView* depthStencilView = nullptr;
    {
        D3D11_DEPTH_STENCIL_VIEW_DESC viewDesc;
        viewDesc.Format = format;
        viewDesc.ViewDimension = D3D11_DSV_DIMENSION_TEXTURE2D;
        viewDesc.Texture2D.MipSlice = 0;
        viewDesc.Flags = 0;
        hr = gpu->device()->CreateDepthStencilView(info.fTexture.get(), &viewDesc, &depthStencilView);
        GR_D3D_CALL_ERRCHECK(hr);
    }

    return sk_sp<GrD3D11Attachment>(new GrD3D11Attachment(gpu,
                                                      dimensions,
                                                      UsageFlags::kStencilAttachment,
                                                      format,
                                                      desc,
                                                      info,
                                                      depthStencilView,
                                                      /*label=*/"D3DAttachment_MakeStencil"));
}

void GrD3D11Attachment::onRelease() {
    fInfo.fTexture.reset();
    fView.reset();

    GrAttachment::onRelease();
}

void GrD3D11Attachment::onAbandon() {
    fInfo.fTexture.reset();
    fView.reset();

    GrAttachment::onAbandon();
}

GrD3D11Gpu* GrD3D11Attachment::getD3D11Gpu() const {
    SkASSERT(!this->wasDestroyed());
    return static_cast<GrD3D11Gpu*>(this->getGpu());
}

void GrD3D11Attachment::onSetLabel() {
    SkASSERT(this->d3d11Resource());
    if (!this->getLabel().empty()) {
        const std::string label = "_Skia_" + this->getLabel();
        this->d3d11Resource()->SetPrivateData(
                WKPDID_D3DDebugObjectName, label.size(), label.c_str());
    }
}
