/*
 * Copyright 2017 Google Inc.
 *
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */

#ifndef GrD3D11Buffer_DEFINED
#define GrD3D11Buffer_DEFINED

#include "src/gpu/ganesh/GrCaps.h"
#include "src/gpu/ganesh/GrGpuBuffer.h"
#include "src/gpu/ganesh/d3d11/GrD3D11Gpu.h"

class GrD3D11Buffer : public GrGpuBuffer {
public:
    static sk_sp<GrD3D11Buffer> Make(GrD3D11Gpu*, size_t size, GrGpuBufferType, GrAccessPattern);

    ~GrD3D11Buffer() override { releaseResource(); }

    ID3D11Buffer* d3d11Resource() const {
        SkASSERT(fD3D11Buffer);
        return fD3D11Buffer.get();
    }

protected:
    GrD3D11Buffer(GrD3D11Gpu* gpu,
                  size_t sizeInBytes,
                  GrGpuBufferType type,
                  GrAccessPattern accessPattern,
                  gr_cp<ID3D11Buffer>,
                  std::string_view label);

    void onAbandon() override;
    void onRelease() override;

private:
    void releaseResource();

    void onMap(MapType) override;
    void onUnmap(MapType) override;
    bool onClearToZero() override;
    bool onUpdateData(const void* src, size_t offset, size_t size, bool preserve) override;

    void* internalMap(MapType, size_t offset, size_t size);
    void internalUnmap(MapType, size_t offset, size_t size);

#ifdef SK_DEBUG
    void validate() const;
#endif

    void onSetLabel() override;

    GrD3D11Gpu* getD3D11Gpu() const {
        SkASSERT(!this->wasDestroyed());
        return reinterpret_cast<GrD3D11Gpu*>(this->getGpu());
    }

    gr_cp<ID3D11Buffer> fD3D11Buffer;
    void* fStagingBuffer = nullptr;

    using INHERITED = GrGpuBuffer;
};

#endif
