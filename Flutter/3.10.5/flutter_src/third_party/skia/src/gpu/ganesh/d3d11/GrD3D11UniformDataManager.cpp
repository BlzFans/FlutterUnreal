/*
* Copyright 2016 Google Inc.
*
* Use of this source code is governed by a BSD-style license that can be
* found in the LICENSE file.
*/

#include "src/gpu/ganesh/d3d11/GrD3D11UniformDataManager.h"

#include "src/gpu/ganesh/d3d11/GrD3D11Gpu.h"
#include "src/gpu/ganesh/d3d11/GrD3D11Buffer.h"

GrD3D11UniformDataManager::GrD3D11UniformDataManager(const UniformInfoArray& uniforms,
                                                             uint32_t uniformSize)
    : INHERITED(uniforms.count(), uniformSize) {
    // We must add uniforms in same order as the UniformInfoArray so that UniformHandles already
    // owned by other objects will still match up here.
    int i = 0;
    for (const auto& uniformInfo : uniforms.items()) {
        Uniform& uniform = fUniforms[i];
        SkASSERT(GrShaderVar::kNonArray == uniformInfo.fVariable.getArrayCount() ||
                 uniformInfo.fVariable.getArrayCount() > 0);
        SkDEBUGCODE(
            uniform.fArrayCount = uniformInfo.fVariable.getArrayCount();
            uniform.fType = uniformInfo.fVariable.getType();
        )

        uniform.fOffset = uniformInfo.fUBOOffset;
        ++i;
    }
}

void GrD3D11UniformDataManager::uploadConstants(GrD3D11Gpu* gpu) 
{
    if (fUniformSize > 0) {
        if (!fUniformBuffer) {
            fUniformBuffer = GrD3D11Buffer::Make(
                    gpu, fUniformSize, GrGpuBufferType::kUniform, kDynamic_GrAccessPattern);
        }

        if (fUniformsDirty) {
            fUniformBuffer->updateData(fUniformData.get(), 0, fUniformSize, false);
            fUniformsDirty = false;
        }

        auto buf = fUniformBuffer->d3d11Resource();
        gpu->deviceContext()->VSSetConstantBuffers(0, 1, &buf);
        gpu->deviceContext()->PSSetConstantBuffers(0, 1, &buf);
    }
}
