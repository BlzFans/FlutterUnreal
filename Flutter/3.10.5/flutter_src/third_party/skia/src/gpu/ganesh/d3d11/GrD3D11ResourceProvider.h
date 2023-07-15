/*
 * Copyright 2020 Google LLC
 *
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */

#ifndef GrD3D11ResourceProvider_DEFINED
#define GrD3D11ResourceProvider_DEFINED

#include "include/gpu/d3d11/GrD3D11Types.h"
#include "include/private/base/SkTArray.h"
#include "src/core/SkTHash.h"
#include "src/core/SkLRUCache.h"
#include "src/gpu/ganesh/GrProgramDesc.h"
#include "src/gpu/ganesh/GrRingBuffer.h"

#include <memory>

class GrD3D11Gpu;
class GrSamplerState;
struct GrD3D11Program;
class GrD3D11RenderTarget;
class GrD3D11Buffer;

class GrD3D11ResourceProvider {
public:
    GrD3D11ResourceProvider(GrD3D11Gpu*);

    void destroyResources();

    ID3D11SamplerState* findOrCreateCompatibleSampler(const GrSamplerState& params);

    GrD3D11Program* findOrCreateProgram(GrD3D11RenderTarget* renderTarget, const GrProgramInfo&);

    void prepForSubmit();

    void markProgramUniformsDirty() { fProgramCache->markProgramUniformsDirty(); }

#if GR_TEST_UTILS
    void resetShaderCacheForTesting() const { fProgramCache->release(); }
#endif

private:
#ifdef SK_DEBUG
#define GR_PROGRAM_CACHE_STATS
#endif

    class ProgramCache : public ::SkNoncopyable {
    public:
        ProgramCache(GrD3D11Gpu* gpu);
        ~ProgramCache();

        void release();
        GrD3D11Program* refProgram(GrD3D11RenderTarget* renderTarget, const GrProgramInfo&);

        void markProgramUniformsDirty();

    private:
        struct Entry;

        struct DescHash {
            uint32_t operator()(const GrProgramDesc& desc) const {
                return SkOpts::hash_fn(desc.asKey(), desc.keyLength(), 0);
            }
        };

        SkLRUCache<const GrProgramDesc, std::unique_ptr<Entry>, DescHash> fMap;

        GrD3D11Gpu* fGpu;

#ifdef GR_PROGRAM_CACHE_STATS
        int fTotalRequests;
        int fCacheMisses;
#endif
    };

    GrD3D11Gpu* fGpu;

    std::unique_ptr<ProgramCache> fProgramCache;
    skia_private::THashMap<uint32_t, ID3D11SamplerState*> fSamplers;
};

#endif
