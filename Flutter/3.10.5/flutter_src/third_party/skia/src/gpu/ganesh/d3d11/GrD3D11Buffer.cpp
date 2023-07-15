
#include "src/gpu/ganesh/d3d11/GrD3D11Buffer.h"

#ifdef SK_DEBUG
#define VALIDATE() this->validate()
#else
#define VALIDATE() \
    do {           \
    } while (false)
#endif

static gr_cp<ID3D11Buffer> make_d3d11_buffer(GrD3D11Gpu* gpu,
                                           size_t size,
                                           GrGpuBufferType intendedType,
                                           GrAccessPattern accessPattern) {
    D3D11_USAGE usage;
    if (accessPattern == kStatic_GrAccessPattern) {
        SkASSERT(intendedType != GrGpuBufferType::kXferCpuToGpu &&
                 intendedType != GrGpuBufferType::kXferGpuToCpu);

        usage = D3D11_USAGE_DEFAULT;
    } else {
        if (intendedType == GrGpuBufferType::kXferGpuToCpu ||
            intendedType == GrGpuBufferType::kXferCpuToGpu) {
            usage = D3D11_USAGE_STAGING;
        } else {
            usage = D3D11_USAGE_DYNAMIC;
        }
    }

    D3D11_BUFFER_DESC desc{};
    desc.ByteWidth = size;
    desc.Usage = usage;

    if (usage == D3D11_USAGE_DYNAMIC)
        desc.CPUAccessFlags = D3D11_CPU_ACCESS_WRITE;
    else if (usage == D3D11_USAGE_STAGING && intendedType == GrGpuBufferType::kXferGpuToCpu)
        desc.CPUAccessFlags = D3D11_CPU_ACCESS_READ;
    else if (usage == D3D11_USAGE_STAGING && intendedType == GrGpuBufferType::kXferCpuToGpu)
        desc.CPUAccessFlags = D3D11_CPU_ACCESS_WRITE;

    if (intendedType == GrGpuBufferType::kVertex)
        desc.BindFlags = D3D11_BIND_VERTEX_BUFFER;
    else if (intendedType == GrGpuBufferType::kIndex)
        desc.BindFlags = D3D11_BIND_INDEX_BUFFER;
    else if (intendedType == GrGpuBufferType::kUniform) {
        desc.BindFlags = D3D11_BIND_CONSTANT_BUFFER;
        desc.ByteWidth = SkAlignTo(size, 16);
    }

    gr_cp<ID3D11Buffer> resource;
    HRESULT hr = gpu->device()->CreateBuffer(&desc, NULL, &resource);
    GR_D3D_CALL_ERRCHECK(hr);
    return resource;
}

sk_sp<GrD3D11Buffer> GrD3D11Buffer::Make(GrD3D11Gpu* gpu,
                                     size_t size,
                                     GrGpuBufferType intendedType,
                                     GrAccessPattern accessPattern) {
    gr_cp<ID3D11Buffer> resource = make_d3d11_buffer(gpu, size, intendedType, accessPattern);
    if (!resource) {
        return nullptr;
    }

    return sk_sp<GrD3D11Buffer>(new GrD3D11Buffer(gpu,
                                              size,
                                              intendedType,
                                              accessPattern,
                                              std::move(resource),
                                              /*label=*/"MakeD3DBuffer"));
}

GrD3D11Buffer::GrD3D11Buffer(GrD3D11Gpu* gpu,
                         size_t size,
                         GrGpuBufferType intendedType,
                         GrAccessPattern accessPattern,
                         gr_cp<ID3D11Buffer> bufferResource,
                         std::string_view label)
        : INHERITED(gpu, size, intendedType, accessPattern, label)
        , fD3D11Buffer(std::move(bufferResource)) {
    this->registerWithCache(skgpu::Budgeted::kYes);

    // TODO: persistently map UPLOAD resources?

    VALIDATE();
}

void GrD3D11Buffer::releaseResource() {
    if (this->wasDestroyed()) {
        return;
    }

    if (fMapPtr) {
        this->unmap();
    }

    SkASSERT(fStagingBuffer == nullptr);
    SkASSERT(fD3D11Buffer);
    fD3D11Buffer.reset();
}

void GrD3D11Buffer::onRelease() {
    this->releaseResource();
    this->INHERITED::onRelease();
}

void GrD3D11Buffer::onAbandon() {
    this->releaseResource();
    this->INHERITED::onAbandon();
}

void GrD3D11Buffer::onMap(MapType type) { 
    fMapPtr = this->internalMap(type, 0, this->size()); 
}

void GrD3D11Buffer::onUnmap(MapType type) {
    this->internalUnmap(type, 0, this->size()); 
}

bool GrD3D11Buffer::onClearToZero() { 
    if (!fD3D11Buffer) {
        return false;
    }

    if (accessPattern() == kStatic_GrAccessPattern) {
        void* zeros = sk_calloc_throw(this->size());
        this->onUpdateData(zeros, 0, this->size(), /*preserve=*/false);
        sk_free(zeros);
        return true;
    }

    void* ptr = this->internalMap(MapType::kWriteDiscard, 0, this->size());
    if (!ptr) {
        return false;
    }
    std::memset(ptr, 0, this->size());
    this->internalUnmap(MapType::kWriteDiscard, 0, this->size());

    return true;
}

bool GrD3D11Buffer::onUpdateData(const void* src,
                                 size_t offset,
                                 size_t size,
                                 bool preserve) {
    if (!fD3D11Buffer) {
        return false;
    }

    if (accessPattern() == kStatic_GrAccessPattern) {
        D3D11_BOX box;
        box.back = 1;
        box.front = 0;
        box.top = 0;
        box.bottom = 1;
        box.left = offset;
        box.right = offset + size;

        // update the real vb buffer
        getD3D11Gpu()->deviceContext()->UpdateSubresource(
                fD3D11Buffer.get(), 0, &box, src, size, 0);

        return true;
    }

    void* ptr = this->internalMap(MapType::kWriteDiscard, offset, size);
    if (!ptr) {
        return false;
    }
    memcpy(ptr, src, size);
    this->internalUnmap(MapType::kWriteDiscard, offset, size);

    return true;
}

void* GrD3D11Buffer::internalMap(MapType type, size_t offset, size_t size) {
    // TODO: if UPLOAD heap type, could be persistently mapped (i.e., this would be a no-op)
    SkASSERT(fD3D11Buffer);
    SkASSERT(!this->isMapped());
    SkASSERT(offset + size <= this->size());

    VALIDATE();

    void* res = nullptr;
    if (this->accessPattern() == kStatic_GrAccessPattern) {
        res = sk_calloc_throw(this->size());
        fStagingBuffer = res;
    } else {
        D3D11_MAPPED_SUBRESOURCE mappedResource;

        D3D11_MAP mapType;
        if (type == MapType::kRead)
            mapType = D3D11_MAP_READ;
        else if (type == MapType::kWriteDiscard)
            mapType = D3D11_MAP_WRITE_DISCARD;
        else {
            SkASSERT(false);
            mapType = D3D11_MAP_WRITE;
        }

        if (intendedType() == GrGpuBufferType::kXferCpuToGpu) {
            mapType = D3D11_MAP_WRITE;
        }

        UINT flags = 0;
        auto hr = getD3D11Gpu()->deviceContext()->Map(fD3D11Buffer.get(), 0, mapType, flags, &mappedResource);
        GR_D3D_CALL_ERRCHECK(hr);
        res = mappedResource.pData;
        SkASSERT(res);
    }

    if (res) {
        res = SkTAddOffset<void>(res, offset);
    }
    VALIDATE();
    return res;
}

void GrD3D11Buffer::internalUnmap(MapType type, size_t offset, size_t size) {
    // TODO: if UPLOAD heap type, could be persistently mapped (i.e., this would be a no-op)
    SkASSERT(fD3D11Buffer);
    SkASSERT(offset + size <= this->size());
    VALIDATE();

    if (this->accessPattern() == kStatic_GrAccessPattern) {
        SkASSERT(fStagingBuffer);
        onUpdateData(fStagingBuffer, 0, this->size(), false);
        sk_free(fStagingBuffer);
        fStagingBuffer = nullptr;
    } else {
        getD3D11Gpu()->deviceContext()->Unmap(fD3D11Buffer.get(), 0);
    }

    VALIDATE();
}

void GrD3D11Buffer::onSetLabel() {
    SkASSERT(fD3D11Buffer);
    if (!this->getLabel().empty()) {
        const std::string label = "_Skia_" + this->getLabel();
        this->d3d11Resource()->SetPrivateData(WKPDID_D3DDebugObjectName, label.size(), label.c_str());
    }
}

#ifdef SK_DEBUG
void GrD3D11Buffer::validate() const {
}
#endif
