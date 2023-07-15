/*
 * Copyright 2020 Google LLC
 *
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */

#include "src/gpu/ganesh/d3d11/GrD3D11ResourceProvider.h"

#include "include/gpu/GrContextOptions.h"
#include "include/gpu/GrDirectContext.h"
#include "include/private/SkOpts_spi.h"
#include "src/gpu/ganesh/GrDirectContextPriv.h"
#include "src/gpu/ganesh/d3d11/GrD3D11Gpu.h"
#include "src/gpu/ganesh/d3d11/GrD3D11RenderTarget.h"
#include "src/gpu/ganesh/d3d11/GrD3D11ProgramBuilder.h"
#include "src/gpu/ganesh/d3d11/GrD3D11Buffer.h"

GrD3D11ResourceProvider::GrD3D11ResourceProvider(GrD3D11Gpu* gpu)
        : fGpu(gpu)
        , fProgramCache(new ProgramCache(gpu))
{
}

void GrD3D11ResourceProvider::destroyResources() {
    for (auto itr = fSamplers.begin(); itr != fSamplers.end(); itr++) {
        itr->second->Release();
    }
    fSamplers.reset();


    fProgramCache->release();
}

static D3D11_TEXTURE_ADDRESS_MODE wrap_mode_to_d3d11_address_mode(GrSamplerState::WrapMode wrapMode) {
    switch (wrapMode) {
    case GrSamplerState::WrapMode::kClamp:
        return D3D11_TEXTURE_ADDRESS_CLAMP;
    case GrSamplerState::WrapMode::kRepeat:
        return D3D11_TEXTURE_ADDRESS_WRAP;
    case GrSamplerState::WrapMode::kMirrorRepeat:
        return D3D11_TEXTURE_ADDRESS_MIRROR;
    case GrSamplerState::WrapMode::kClampToBorder:
        return D3D11_TEXTURE_ADDRESS_BORDER;
    }
    SK_ABORT("Unknown wrap mode.");
}

static D3D11_FILTER d3d11_filter(GrSamplerState sampler) {
    if (sampler.isAniso()) {
        return D3D11_FILTER_ANISOTROPIC;
    }
    switch (sampler.mipmapMode()) {
        // When the mode is kNone we disable filtering using maxLOD.
        case GrSamplerState::MipmapMode::kNone:
        case GrSamplerState::MipmapMode::kNearest:
            switch (sampler.filter()) {
                case GrSamplerState::Filter::kNearest: return D3D11_FILTER_MIN_MAG_MIP_POINT;
                case GrSamplerState::Filter::kLinear:  return D3D11_FILTER_MIN_MAG_LINEAR_MIP_POINT;
            }
            SkUNREACHABLE;
        case GrSamplerState::MipmapMode::kLinear:
            switch (sampler.filter()) {
                case GrSamplerState::Filter::kNearest: return D3D11_FILTER_MIN_MAG_POINT_MIP_LINEAR;
                case GrSamplerState::Filter::kLinear:  return D3D11_FILTER_MIN_MAG_MIP_LINEAR;
            }
            SkUNREACHABLE;
    }
    SkUNREACHABLE;
}

ID3D11SamplerState* GrD3D11ResourceProvider::findOrCreateCompatibleSampler(
        const GrSamplerState& params) {
    // In D3D anisotropic filtering uses the same field (D3D12_SAMPLER_DESC::Filter) as min/mag/mip
    // settings and so is not orthogonal to them.
    uint32_t key = params.asKey(/*anisoIsOrthogonal=*/false);
    ID3D11SamplerState** samplerPtr = fSamplers.find(key);
    if (samplerPtr) {
        return *samplerPtr;
    }

    D3D11_FILTER filter = d3d11_filter(params);
    // We disable MIP filtering using maxLOD. Otherwise, we want the max LOD to be unbounded.
    float maxLOD = params.mipmapped() == GrMipmapped::kYes ? std::numeric_limits<float>::max()
                                                           : 0.f;
    D3D11_TEXTURE_ADDRESS_MODE addressModeU = wrap_mode_to_d3d11_address_mode(params.wrapModeX());
    D3D11_TEXTURE_ADDRESS_MODE addressModeV = wrap_mode_to_d3d11_address_mode(params.wrapModeY());
    unsigned int maxAnisotropy = params.maxAniso();

    D3D11_SAMPLER_DESC desc = {};
    desc.Filter = filter;
    desc.AddressU = addressModeU;
    desc.AddressV = addressModeV;
    desc.AddressW = D3D11_TEXTURE_ADDRESS_CLAMP;
    desc.MipLODBias = 0;
    desc.MaxAnisotropy = maxAnisotropy;
    desc.ComparisonFunc = D3D11_COMPARISON_ALWAYS;
    // desc.BorderColor initialized to { 0, 0, 0, 0 } by default initializer, above.
    desc.MinLOD = 0;
    desc.MaxLOD = maxLOD;

    ID3D11SamplerState* sampler = nullptr;
    auto hr = fGpu->device()->CreateSamplerState(&desc, &sampler);
    GR_D3D_CALL_ERRCHECK(hr);

    fSamplers.set(key, sampler);
    return sampler;
}

GrD3D11Program* GrD3D11ResourceProvider::findOrCreateProgram(GrD3D11RenderTarget* renderTarget, const GrProgramInfo& info) {
    return fProgramCache->refProgram(renderTarget, info);
}

void GrD3D11ResourceProvider::prepForSubmit() {
}

////////////////////////////////////////////////////////////////////////////////////////////////

#ifdef GR_PROGRAM_CACHE_STATS
static const bool c_DisplayProgramCache{false};
#endif

struct GrD3D11ResourceProvider::ProgramCache::Entry {
    Entry(GrD3D11Gpu* gpu, std::unique_ptr<GrD3D11Program> program)
            : fGpu(gpu), fProgram(std::move(program)) {}

    GrD3D11Gpu* fGpu;
    std::unique_ptr<GrD3D11Program> fProgram;
};

GrD3D11ResourceProvider::ProgramCache::ProgramCache(GrD3D11Gpu* gpu)
        : fMap(gpu->getContext()->priv().options().fRuntimeProgramCacheSize)
        , fGpu(gpu)
#ifdef GR_PIPELINE_STATE_CACHE_STATS
        , fTotalRequests(0)
        , fCacheMisses(0)
#endif
{
}

GrD3D11ResourceProvider::ProgramCache::~ProgramCache() {
    // dump stats
#ifdef GR_PROGRAM_CACHE_STATS
    if (c_DisplayProgramCache) {
        SkDebugf("--- Pipeline State Cache ---\n");
        SkDebugf("Total requests: %d\n", fTotalRequests);
        SkDebugf("Cache misses: %d\n", fCacheMisses);
        SkDebugf("Cache miss %%: %f\n",
                 (fTotalRequests > 0) ? 100.f * fCacheMisses / fTotalRequests : 0.f);
        SkDebugf("---------------------\n");
    }
#endif
}

void GrD3D11ResourceProvider::ProgramCache::release() {
    fMap.reset();
}

GrD3D11Program* GrD3D11ResourceProvider::ProgramCache::refProgram(GrD3D11RenderTarget* renderTarget, const GrProgramInfo& programInfo) {
#ifdef GR_PROGRAM_CACHE_STATS
    ++fTotalRequests;
#endif

    const GrCaps* caps = fGpu->caps();

    GrProgramDesc desc = caps->makeDesc(renderTarget, programInfo);
    if (!desc.isValid()) {
        GrCapsDebugf(fGpu->caps(), "Failed to build mtl program descriptor!\n");
        return nullptr;
    }

    std::unique_ptr<Entry>* entry = fMap.find(desc);
    if (!entry) {
#ifdef GR_PROGRAM_CACHE_STATS
        ++fCacheMisses;
#endif
        std::unique_ptr<GrD3D11Program> program =
                GrD3D11ProgramBuilder::MakeD3D11Program(fGpu, desc, programInfo);
        if (!program) {
            return nullptr;
        }
        entry = fMap.insert(desc, std::unique_ptr<Entry>(
                new Entry(fGpu, std::move(program))));
        return ((*entry)->fProgram).get();
    }
    return ((*entry)->fProgram).get();
}

void GrD3D11ResourceProvider::ProgramCache::markProgramUniformsDirty() {
    fMap.foreach ([](const GrProgramDesc*, std::unique_ptr<Entry>* entry) {
        (*entry)->fProgram->markUniformsDirty();
    });
}

