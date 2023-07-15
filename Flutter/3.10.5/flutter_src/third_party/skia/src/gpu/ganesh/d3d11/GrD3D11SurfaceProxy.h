/*
 * Copyright 2021 Google Inc.
 *
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */

#ifndef GrD3D11SurfaceProxy_DEFINED
#define GrD3D11SurfaceProxy_DEFINED

#include "src/gpu/ganesh/GrSurfaceProxy.h"

class GrD3D11SurfaceProxy : public GrSurfaceProxy {
public:
    GrD3D11SurfaceProxy(SkString name, std::string_view label)
            : GrSurfaceProxy(GrBackendFormat::MakeDxgi(DXGI_FORMAT_R8G8B8A8_UNORM),
                             SkISize::Make(1, 1),
                             SkBackingFit::kExact,
                             SkBudgeted::kNo,
                             GrProtected::kNo,
                             GrInternalSurfaceFlags::kNone,
                             UseAllocator::kNo,
                             label) {
        SkDEBUGCODE(this->setDebugName(std::move(name)));
    }

    bool instantiate(GrResourceProvider*) override { return false; }
    SkDEBUGCODE(void onValidateSurface(const GrSurface*) override {} )
    size_t onUninstantiatedGpuMemorySize() const override { return 0; }

protected:
    sk_sp<GrSurface> createSurface(GrResourceProvider*) const override { return nullptr; }

private:
    LazySurfaceDesc callbackDesc() const override { SkUNREACHABLE; }
};

#endif
