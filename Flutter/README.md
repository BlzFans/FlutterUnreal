# 1. Build the original Flutter Engine (version: 3.27.1)
Reference: https://github.com/flutter/engine/blob/main/docs/contributing/Compiling-the-engine.md

Notice: src/flutter must be switched to tag 3.27.1

# 2. Override some modify to the Flutter Engine
1. Patch skia
cd src\flutter\third_party\skia
git apply skia_3.27.patch

2. Install d3d12allocator
cd src\flutter\third_party\skia\third_party
md externals
cd externals
git clone https://skia.googlesource.com/external/github.com/GPUOpen-LibrariesAndSDKs/D3D12MemoryAllocator.git d3d12allocator
git checkout 169895d

3. Patch the flutter engine
cd src\flutter\
git apply flutter_engine_3.27.1.patch

4. Build the flutter engine
Run command "ninja -C out/host_release" to Build the Flutter Engine 
Copy flutter_embedder.h, flutter_engine.dll, flutter_engine.dll.lib form out/host_release to UnrealDemo/Plugins/FlutterUnreal/Source/ThirdParty/flutter_engine

# 3. Install the original Flutter SDK (version: 3.27.1)
https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.27.1-stable.zip

# 4. Override some modify to the Flutter SDK
cd flutter_windows_3.27.1-stable\flutter
git apply flutter_sdk_3.27.1.patch
