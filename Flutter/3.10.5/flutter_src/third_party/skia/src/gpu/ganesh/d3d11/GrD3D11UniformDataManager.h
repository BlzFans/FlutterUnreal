/*
* Copyright 2020 Google LLC
*
* Use of this source code is governed by a BSD-style license that can be
* found in the LICENSE file.
*/

#ifndef GrD3D11UniformDataManager_DEFINED
#define GrD3D11UniformDataManager_DEFINED

#include "src/gpu/ganesh/GrUniformDataManager.h"

#include "include/gpu/d3d11/GrD3D11Types.h"
#include "src/gpu/ganesh/GrSPIRVUniformHandler.h"
#include "src/gpu/ganesh/d3d11/GrD3D11Buffer.h"

class GrD3D11Gpu;
class GrD3D11Buffer;

class GrD3D11UniformDataManager : public GrUniformDataManager {
public:
    typedef GrSPIRVUniformHandler::UniformInfoArray UniformInfoArray;

    GrD3D11UniformDataManager(const UniformInfoArray&,
                                  uint32_t uniformSize);

    void uploadConstants(GrD3D11Gpu* gpu);

private:
    sk_sp<GrD3D11Buffer> fUniformBuffer;
    using INHERITED = GrUniformDataManager;
};

#endif
