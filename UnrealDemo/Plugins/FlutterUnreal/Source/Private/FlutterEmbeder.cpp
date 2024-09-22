
#include "FlutterEmbeder.h"

#if FLUTTERUNREAL_WITH_LUA
#include "FlutterLua.h"
#endif

#include "FlutterTextInput.h"
#include "FlutterKeyboard.h"

#include "HardwareInfo.h"

#if PLATFORM_WINDOWS

#define FindShaderResourceDXGIFormat FindShaderResourceDXGIFormat_D3D12
#define FindUnorderedAccessDXGIFormat FindUnorderedAccessDXGIFormat_D3D12
#define FindDepthStencilDXGIFormat FindDepthStencilDXGIFormat_D3D12
#define HasStencilBits HasStencilBits_D3D12
#define GetRenderTargetFormat GetRenderTargetFormat_D3D12
#define FD3DGPUProfiler FD3DGPUProfiler_D3D12

#include "D3D12RHIPrivate.h"
#include "D3D12Util.h"

#undef FindShaderResourceDXGIFormat
#undef FindUnorderedAccessDXGIFormat
#undef FindDepthStencilDXGIFormat
#undef HasStencilBits
#undef GetRenderTargetFormat
#undef FD3DGPUProfiler

#include "D3D11RHIPrivate.h"
#include "D3D11Util.h"

#include "Windows/WindowsPlatformApplicationMisc.h"
#endif

#include "Runtime/Engine/Classes/Engine/UserInterfaceSettings.h"
#include "Interfaces/IPluginManager.h"
#include "Slate/SceneViewport.h"
#include "Widgets/SViewport.h"
#include "FlutterUnreal.h"

#include <vector>
#include <string>

FlutterRendererType g_flutterRendererType = (FlutterRendererType)-1;
bool g_flutterPresented = false;
FlutterEngine g_flutterEngine = nullptr;
FlutterEngineAOTData g_aotData = nullptr;
float g_pixelRatio = 1.0f;
int g_screenWidth = 0;
int g_screenHeight = 0;

FIntPoint g_gameViewPos;
FIntPoint g_gameViewSize;

bool g_keyEventHandled = false;
std::string g_flutterDataPath;
std::string g_luaPath;

#if PLATFORM_WINDOWS || PLATFORM_ANDROID
void* VulkanGetInstanceProcAddressCallback(void* user_data, FlutterVulkanInstanceHandle instance, const char* procname)
{
    auto* proc = VulkanDynamicAPI::vkGetInstanceProcAddr(reinterpret_cast<VkInstance>(instance), procname);
    return reinterpret_cast<void*>(proc);
}

FlutterVulkanImage VulkanGetNextImageCallback(void* user_data, const FlutterFrameInfo* frame_info)
{
    FlutterVulkanImage vulkanImage{};
    vulkanImage.struct_size = sizeof(FlutterVulkanImage);

    MyVulkanViewport* Viewport = ((MyVulkanDynamicRHI*)GVulkanRHI)->GetDrawingViewport();
    MyVulkanSwapChain* SwapChain = (MyVulkanSwapChain*)Viewport->GetSwapChain();

    int index = SwapChain->GetCurrentImageIndex();
    vulkanImage.image = reinterpret_cast<uint64_t>(Viewport->GetBackBufferImage(index));
    vulkanImage.format = (Viewport->GetPixelFormat() == PF_A2B10G10R10 ? (uint32_t)VK_FORMAT_A2B10G10R10_UNORM_PACK32 : (uint32_t)VK_FORMAT_B8G8R8A8_UNORM); //VK_FORMAT_A2B10G10R10_UNORM_PACK32;

    return vulkanImage;
}
#endif

#if PLATFORM_WINDOWS

class MyD3D11DynamicRHI : public FD3D11DynamicRHI
{
public:
    FD3D11Viewport* GetDrawingViewport()
    {
        return DrawingViewport.GetReference();
    }
};

void OnBeginDrawing()
{
    if (g_flutterRendererType == kD3D11)
    {
        MyD3D11DynamicRHI* DynamicRHI = static_cast<MyD3D11DynamicRHI*>(GDynamicRHI);
        FD3D11Viewport* Viewport = DynamicRHI->GetDrawingViewport();
        GFlutterUnrealModule->SetRHIViewport(Viewport);
    }
    else if(g_flutterRendererType == kD3D12)
    {
        FD3D12DynamicRHI* DynamicRHI = (FD3D12DynamicRHI*)GDynamicRHI;
        FD3D12Viewport* Viewport = DynamicRHI->GetAdapter().GetDrawingViewport();
        GFlutterUnrealModule->SetRHIViewport(Viewport);
    }
}

void* D3D11GetBackBuffer()
{
    FRHIViewport* RHIViewport = GFlutterUnrealModule->GetRHIViewport();
    void* BackBuffer = RHIViewport->GetNativeBackBufferTexture();
    return BackBuffer;
}

void* D3D12GetBackBuffer()
{
    FRHIViewport* RHIViewport = GFlutterUnrealModule->GetRHIViewport();
    void* BackBuffer = ((FD3D12Resource*)RHIViewport->GetNativeBackBufferTexture())->GetResource();
    return BackBuffer;
}

#endif

bool VulkanPresentCallback(void* user_data, const FlutterVulkanImage* image)
{
    g_flutterPresented = true;
    return true;
}

bool OpenGLPresentCallback(void* user_data)
{
    g_flutterPresented = true;
    return true;
}

bool D3D11PresentCallback(void* user_data)
{
    g_flutterPresented = true;
    return true;
}

bool D3D12PresentCallback(void* user_data)
{
    g_flutterPresented = true;
    return true;
}

void FlutterDamageCallback(void*, const intptr_t, FlutterDamage* flutterDamage)
{
    flutterDamage->num_rects = 1;

    static FlutterRect rect{};

    FIntPoint screenSize = GEngine->GameViewport->Viewport->GetSizeXY();
    rect.right = screenSize.X;
    rect.bottom = screenSize.Y;
    flutterDamage->damage = &rect;
}

FlutterEngineAOTData LoadAotData(const char* aot_data_path) {
    FlutterEngineAOTDataSource source = {};
    source.type = kFlutterEngineAOTDataSourceTypeElfPath;
    source.elf_path = aot_data_path;
    FlutterEngineAOTData data = nullptr;
    auto result = FlutterEngineCreateAOTData(&source, &data);
    if (result != kSuccess) {
        UE_LOG(LogTemp, Warning, TEXT("Failed to load AOT data from: %s"), UTF8_TO_TCHAR(aot_data_path));
        return nullptr;
    }

    return data;
}

static Cpp2DartFunction* s_cpp2dartFunctionList = nullptr;
Cpp2DartFunction::Cpp2DartFunction(void* function, const char* name)
    :function(function)
    ,name(name)
    ,next(s_cpp2dartFunctionList)
{
    s_cpp2dartFunctionList = this;
}

static void* ResolveFfiNativeFunction(const char* name, uintptr_t args) {
    //UE_LOG(LogTemp, Warning, TEXT("ResolveFfiNativeFunction %s %d"), UTF8_TO_TCHAR(name), (int)args);
    for (Cpp2DartFunction* entry = s_cpp2dartFunctionList; entry; entry = entry->next)
    {
        if (strcmp(name, entry->name) == 0)
            return entry->function;
    }

    UE_LOG(LogTemp, Warning, TEXT("Unknown dart function %s %d"), UTF8_TO_TCHAR(name), (int)args);
    return nullptr;
}


static Dart2CppFunction* s_dart2cppFunctionList = nullptr;
Dart2CppFunction::Dart2CppFunction(void* functionPPtr, const char* funcName)
    :dartFunctionPPtr(functionPPtr)
    ,name(funcName)
    ,next(s_dart2cppFunctionList)
{
    s_dart2cppFunctionList = this;
}

static uint64_t getTimeStamp()
{
    /*
    return std::chrono::duration_cast<std::chrono::microseconds>(
        std::chrono::high_resolution_clock::now().time_since_epoch())
        .count();
    */

    return FlutterEngineGetCurrentTime();
}

void FlutterRootIsolateCreateCallback(void* userData)
{
    FlutterEngineNativeBinding();
    FlutterEngineSetFfiNativeResolver(ResolveFfiNativeFunction);

    UE_LOG(LogTemp, Log, TEXT("Flutter root isolate created"));
}

TArray<const ANSICHAR*> InstanceExtensions;
TArray<const ANSICHAR*> DeviceExtensions;
FlutterRendererConfig flutterGetRenderConfig()
{
    FlutterRendererConfig config = {};

    if (g_flutterRendererType == kVulkan)
    {
#if PLATFORM_WINDOWS || PLATFORM_ANDROID
        config.type = kVulkan;
        config.vulkan.struct_size = sizeof(config.vulkan);
        config.vulkan.version = UE_VK_API_VERSION;
        config.vulkan.instance = GVulkanRHI->GetInstance();
        config.vulkan.physical_device = GVulkanRHI->GetDevice()->GetPhysicalHandle();
        config.vulkan.device = GVulkanRHI->GetDevice()->GetInstanceHandle();
        config.vulkan.queue_family_index = GVulkanRHI->GetDevice()->GetGraphicsQueue()->GetFamilyIndex();
        config.vulkan.queue = GVulkanRHI->GetDevice()->GetGraphicsQueue()->GetHandle();

        InstanceExtensions.Empty();
        InstanceExtensions.Push(VK_KHR_SURFACE_EXTENSION_NAME);
#if PLATFORM_WINDOWS
        InstanceExtensions.Push(VK_KHR_WIN32_SURFACE_EXTENSION_NAME);
#else
        InstanceExtensions.Push(VK_KHR_ANDROID_SURFACE_EXTENSION_NAME);
#endif
        bool bOutDebugUtils = GVulkanRHI->SupportsDebugUtilsExt();
        if (bOutDebugUtils)
            InstanceExtensions.Push(VK_EXT_DEBUG_UTILS_EXTENSION_NAME);

        DeviceExtensions.Empty();
        DeviceExtensions.Push(VK_KHR_SWAPCHAIN_EXTENSION_NAME);

        if (bOutDebugUtils)
            DeviceExtensions.Push(VK_EXT_DEBUG_MARKER_EXTENSION_NAME);

        config.vulkan.enabled_instance_extension_count = InstanceExtensions.Num();
        config.vulkan.enabled_instance_extensions = InstanceExtensions.GetData();
        config.vulkan.enabled_device_extension_count = DeviceExtensions.Num();
        config.vulkan.enabled_device_extensions = DeviceExtensions.GetData();

        config.vulkan.get_instance_proc_address_callback = VulkanGetInstanceProcAddressCallback;
        config.vulkan.get_next_image_callback = VulkanGetNextImageCallback;
        config.vulkan.present_image_callback = VulkanPresentCallback;
#endif
    }
    else if (g_flutterRendererType == kOpenGL)
    {
        config.type = kOpenGL;
        config.open_gl.struct_size = sizeof(config.open_gl);
        config.open_gl.make_current = [](void* userdata) -> bool {
            return true;
        };

        config.open_gl.clear_current = [](void*) -> bool {
            return true;
        };

        config.open_gl.present = OpenGLPresentCallback;

        config.open_gl.fbo_callback = [](void*) -> uint32_t {
            return 0;  // FBO0
        };

        /*
        config.open_gl.gl_proc_resolver = [](void*, const char* name) -> void* {
            void* pfn = wglGetProcAddress(name);
            if (pfn == nullptr)
                pfn = (void*)GetProcAddress(hOpenGL, name);

            return pfn;
        };
        */

        config.open_gl.populate_existing_damage = FlutterDamageCallback;
    }
#if PLATFORM_WINDOWS
    else if (g_flutterRendererType == kD3D11)
    {
        FD3D11DynamicRHI* d3d11RHI = static_cast<FD3D11DynamicRHI*>(GDynamicRHI);
        ID3D11Device* D3D11Device = static_cast<ID3D11Device*>(GDynamicRHI->RHIGetNativeDevice());
        
        //ID3D11DeviceContext* D3D11DeviceContext = nullptr;
        //D3D11Device->GetImmediateContext(&D3D11DeviceContext);
        //D3D11DeviceContext->Release();

        config.type = kD3D11;
        config.d3d11.struct_size = sizeof(config.d3d11);
        config.d3d11.device = D3D11Device;
        config.d3d11.deviceContext = d3d11RHI->GetDeviceContext();
        config.d3d11.getBackBuffer = D3D11GetBackBuffer;
        config.d3d11.present = D3D11PresentCallback;
    }
    else if (g_flutterRendererType == kD3D12)
    {
        FD3D12DynamicRHI* DynamicRHI = (FD3D12DynamicRHI*) GDynamicRHI;

        config.type = kD3D12;
        config.d3d12.struct_size = sizeof(config.d3d12);

        config.d3d12.adapter = DynamicRHI->GetAdapter().GetAdapter();
        config.d3d12.device = DynamicRHI->GetAdapter().GetD3DDevice();
        
#if ENGINE_MAJOR_VERSION == 5
        config.d3d12.commandQueue = GDynamicRHI->RHIGetNativeGraphicsQueue();
#else
        config.d3d12.commandQueue = DynamicRHI->RHIGetD3DCommandQueue();
#endif

        config.d3d12.getBackBuffer = D3D12GetBackBuffer;
        config.d3d12.present = D3D12PresentCallback;
    }
#endif
    else
    {
        UE_LOG(LogTemp, Error, TEXT("Not Implemented"));
    }

    return config;
}

static float getDpiScale()
{
#if PLATFORM_WINDOWS
    FMonitorInfo MonitorInfo;
    MonitorInfo.DisplayRect.Left = 0;
    MonitorInfo.DisplayRect.Top = 0;
    MonitorInfo.DisplayRect.Right = 1280;
    MonitorInfo.DisplayRect.Bottom = 720;

    if (GEngine->GameViewport) {
        FVector2D viewportSize;
        GEngine->GameViewport->GetViewportSize(viewportSize);
        MonitorInfo.DisplayRect.Right = (int)viewportSize.X;
        MonitorInfo.DisplayRect.Bottom = (int)viewportSize.Y;
    }

    int dpi = FWindowsPlatformApplicationMisc::GetMonitorDPI(MonitorInfo);
    return (float)dpi / 96;
#else
    FVector2D viewportSize;
    // as this function returns through the parameter, we just need to call it by passing in our FVector2D variable
    GEngine->GameViewport->GetViewportSize(viewportSize);

    // we need to floor the float values of the viewport size so we can pass those into the GetDPIScaleBasedOnSize function
    int32 X = FGenericPlatformMath::FloorToInt(viewportSize.X);
    int32 Y = FGenericPlatformMath::FloorToInt(viewportSize.Y);

    // the GetDPIScaleBasedOnSize function takes an FIntPoint, so we construct one out of the floored floats of the viewport
    // the fuction returns a float, so we can return the value out of our function here
    return GetDefault<UUserInterfaceSettings>(UUserInterfaceSettings::StaticClass())->GetDPIScaleBasedOnSize(FIntPoint(X, Y));
#endif
}

void(*Dart_OnGameViewportResize)(int x, int y, int width, int height);
Dart2Cpp(Dart_OnGameViewportResize);

void checkScreenResized()
{
    UGameViewportClient* GameViewport = GEngine->GameViewport;
    if (GameViewport == nullptr)
        return;

    TSharedPtr<SViewport> GameViewportWidget = GameViewport->GetGameViewportWidget();
    if (GameViewportWidget.IsValid())
    {
        TSharedPtr<SWidget> RootWidget = GameViewportWidget;
        while (RootWidget->GetParentWidget().IsValid())
        {
            RootWidget = RootWidget->GetParentWidget();
        }

        const FGeometry& RootGeometry = RootWidget->GetTickSpaceGeometry();
        FVector2D ScreenSize = RootGeometry.GetAbsoluteSize();

#if WITH_EDITOR
        const FGeometry& ViewportGeometry = GameViewportWidget->GetTickSpaceGeometry();
        FVector2D Position = ViewportGeometry.GetAbsolutePosition();
        FVector2D Size = ViewportGeometry.GetAbsoluteSize();

        Position = Position - RootGeometry.GetAbsolutePosition();

        //FVector2D viewportSize;
        //GameViewport->GetViewportSize(viewportSize);

        FIntPoint gameViewPos((int)Position.X, (int)Position.Y);
        FIntPoint gameViewSize((int)Size.X, (int)Size.Y);

        if (Dart_OnGameViewportResize && (g_gameViewPos != gameViewPos || g_gameViewSize != gameViewSize))
        {
			g_gameViewPos = gameViewPos;
			g_gameViewSize = gameViewSize;

			UE_LOG(LogTemp, Warning, TEXT("%d %d %d %d"), gameViewPos.X, gameViewPos.Y, gameViewSize.X, gameViewSize.Y);

            DartStateScope scope;
			Dart_OnGameViewportResize(gameViewPos.X, gameViewPos.Y, gameViewSize.X, gameViewSize.Y);
        }
#endif

        int w = ScreenSize.X;
        int h = ScreenSize.Y;
        if (g_screenWidth != w || g_screenHeight != h)
        {
            flutterEngineResize(w, h);
        }
    }
}

void flutterEngineResize(int width, int height)
{
    if (g_flutterEngine != nullptr)
    {
        g_screenWidth = width;
        g_screenHeight = height;
        UE_LOG(LogTemp, Warning, TEXT("flutterEngineResize %d %d %f"), width, height, g_pixelRatio);
        FlutterWindowMetricsEvent event = {};
        event.struct_size = sizeof(event);
        event.width = width;
        event.height = height;
        event.pixel_ratio = g_pixelRatio;
        FlutterEngineSendWindowMetricsEvent(g_flutterEngine, &event);
    }
}

void flutterEngineInit(const char* command_line)
{
    if (g_flutterEngine)
        return;

#if FLUTTERUNREAL_WITH_LUA
    initLua();
#endif

    FlutterCustomTaskRunners task_runners = {};
    task_runners.struct_size = sizeof(FlutterCustomTaskRunners);

    /*
    //src\flutter\shell\common\switches.h
    const char* command_line_argv[] = {
        "exe_name",
        "--enable-dart-profiling=true", 
        "--enable-checked-mode=true",
        "--verify-entry-points=true",
        "--verbose-logging=true",
        "--disable-service-auth-codes=false",
        "--observatory-host=0.0.0.0",
        "--observatory-port=12321",
        //"--start-paused=true",
        //"enable-serial-gc=true",
    };
    */

    std::string s(command_line);
    size_t pos = 0;
    std::string token;
    std::string delimiter("::");
    std::vector<std::string> tokens;
    while ((pos = s.find(delimiter)) != std::string::npos) {
        token = s.substr(0, pos);
        if (!token.empty())
            tokens.push_back(token);
        s.erase(0, pos + delimiter.length());
    }
    if (!s.empty())
        tokens.push_back(s);

    std::vector<const char*> argv;
    for (int i = 0; i < tokens.size(); i++)
    {
        argv.push_back(tokens[i].c_str());
    }

    FString DataPath = FPaths::ConvertRelativePathToFull(IPluginManager::Get().FindPlugin("FlutterUnreal")->GetBaseDir() + "/Resources/data");
    UE_LOG(LogTemp, Warning, TEXT("DataPath %s"), *DataPath);

    g_flutterDataPath = TCHAR_TO_ANSI(*DataPath);
    std::string assets_path = g_flutterDataPath + "/flutter_assets";
    std::string icu_data_path = g_flutterDataPath + "/icudtl.dat";
    std::string persistent_cache_path = g_flutterDataPath;
    std::string aot_library_path = g_flutterDataPath + "/app.so";
    g_luaPath = g_flutterDataPath + "/flutter_assets/lua";

    // This directory is generated by `flutter build bundle`.
    FlutterProjectArgs args{};
    args.struct_size = sizeof(FlutterProjectArgs);
    args.assets_path = assets_path.c_str();
    args.icu_data_path = icu_data_path.c_str();  // Find this in your bin/cache directory.
    //args.persistent_cache_path = persistent_cache_path.c_str();
    args.command_line_argc = argv.size();                       //ARRAY_SIZE(command_line_argv);
    args.command_line_argv = argv.empty() ? nullptr : &argv[0]; //command_line_argv;

    //dart argments
    //args.custom_dart_entrypoint
    //args.dart_entrypoint_argc
    //args.dart_entrypoint_argv

    args.root_isolate_create_callback = FlutterRootIsolateCreateCallback;

    extern void MessageCallback(const FlutterPlatformMessage * message, void* userData);
    args.platform_message_callback = MessageCallback;
    /*args.vsync_callback = [](void* user_data, intptr_t baton) -> void {
        uint64_t start = FlutterEngineGetCurrentTime();
        uint64_t target = start;
        FlutterEngineOnVsync(g_flutterEngine, baton, start, target);
    };*/

    if (FlutterEngineRunsAOTCompiledDartCode())
    {
        g_aotData = LoadAotData(aot_library_path.c_str());
        args.aot_data = g_aotData;
    }

    UE_LOG(LogTemp, Warning, TEXT("FlutterEngineRun"));
    void* userData = nullptr;
    auto config = flutterGetRenderConfig();
    FlutterEngineResult result = FlutterEngineRun(FLUTTER_ENGINE_VERSION, &config, &args, userData, &g_flutterEngine);
    if (result != kSuccess || g_flutterEngine == nullptr)
    {
        UE_LOG(LogTemp, Error, TEXT("Failed to start Flutter Engine."));
    }

    g_pixelRatio = getDpiScale();
    checkScreenResized();
}

void flutterEngineShutdown()
{
    if (g_flutterEngine == nullptr)
        return;

    if (FlutterEngineShutdown(g_flutterEngine) != kSuccess) {
        UE_LOG(LogTemp, Error, TEXT("Flutter Engine shutdown failed."));
    }

    if (g_aotData)
    {
        g_aotData = nullptr;
        FlutterEngineCollectAOTData(g_aotData);
    }

#if FLUTTERUNREAL_WITH_LUA
    closeLua();
#endif
}

int64_t (*break_circular_reference)(void*);
Dart2Cpp(break_circular_reference);

void flutterEngineTick()
{
    if (GEngine->GameViewport == nullptr || g_flutterEngine == nullptr)
        return;

#if FLUTTERUNREAL_WITH_LUA
    int top = lua_gettop(g_L);
#endif

    checkScreenResized();

    FlutterEngineRunLoop();

#if FLUTTERUNREAL_WITH_LUA
    static uint64_t lastTime = 0;
    uint64_t currentTime = getTimeStamp();
    if (break_circular_reference && lastTime + 3ull * 1000ull * 1000ull * 1000ull < currentTime) //3 seconds
    {
        DartStateScope scope;
        break_circular_reference(g_L);
        lastTime = currentTime;
    }

    check(lua_gettop(g_L) == top);
#endif
}

/*
void flutterEngineRefresh()
{
    //reset opengl context
    FlutterEngineResetContext(g_flutterEngine);

    FlutterEngineScheduleFrame(g_flutterEngine);

    int count = 0;
    g_flutterPresented = false;
    while (!g_flutterPresented) {
        FlutterEngineRunLoop();
        count++;
    }

    //UE_LOG(LogTemp, Warning, TEXT("flutterEngineRefresh FlutterEngineRunLoop count %d"), count);
}
*/

void flutterEngineRender()
{
    if (GEngine->GameViewport == nullptr)
        return;

#if PLATFORM_WINDOWS
    if (g_flutterRendererType == kD3D11)
    {
        if (D3D11GetBackBuffer() == nullptr)
            return;
    }
    else if (g_flutterRendererType == kD3D12)
    {
        if (D3D12GetBackBuffer() == nullptr)
            return;
    }
#endif

#if PLATFORM_WINDOWS || PLATFORM_ANDROID
    if (g_flutterRendererType == kVulkan)
    {
        MyVulkanViewport* Viewport = ((MyVulkanDynamicRHI*)GVulkanRHI)->GetDrawingViewport();
        if (Viewport == nullptr)
            return;
    }
#endif

    //reset opengl/d3d11 context
    FlutterEngineResetContext(g_flutterEngine);

    g_flutterPresented = false;
    FlutterEngineRunRenderLoop(); //render loop
    if (!g_flutterPresented)
    {
        FlutterEngineDrawLastTree(g_flutterEngine);
    }
}

bool s_flutterDisableInput = false;
void flutterDisableInput(bool disable)
{
    s_flutterDisableInput = disable;
}

void keyEventCallback(bool handled, void* userData)
{
    g_keyEventHandled = handled;
}

bool flutterKeyEvent(uint16_t key, bool down, bool repeat)
{
    if (g_flutterEngine == nullptr || s_flutterDisableInput)
        return false;

    FlutterKeyEvent event;
    event.struct_size = sizeof(FlutterKeyEvent);
    event.timestamp = getTimeStamp(); //double

    if (down)
        event.type = kFlutterKeyEventTypeDown;
    else if (repeat)
        event.type = kFlutterKeyEventTypeRepeat;
    else
        event.type = kFlutterKeyEventTypeUp;

    event.physical = getPhysicalKey(key, false);
    event.logical = getLogicalKey(key, false, getScancodeFromKey(key));
    event.character = 0;
    event.synthesized = true;

    g_keyEventHandled = false;
    FlutterEngineSendKeyEvent(g_flutterEngine, &event, keyEventCallback, nullptr);

    TextInputPlugin::GetInstance().KeyboardHook(key, down, repeat);
    if (flutterHasTextInput()) {
        return true;
    }

    return g_keyEventHandled;
}

bool flutterCharEvent(uint16_t c)
{
    if (g_flutterEngine == nullptr || s_flutterDisableInput)
        return false;

    // Filter non-printable 
    if (c < 0x20)
        return false;

    if (flutterHasTextInput())
    {
        TextInputPlugin::GetInstance().CharHook(c);
        return true;
    }

    return false;
}

bool flutterHasTextInput()
{
    if (s_flutterDisableInput)
        return false;

    return TextInputPlugin::GetInstance().IsActive();
}

static bool s_isMouseDown = false;

bool flutterMouseMoveEvent(int32_t x, int32_t y)
{
    if (g_flutterEngine == nullptr || s_flutterDisableInput)
        return false;

    FlutterPointerEvent event = {};
    event.struct_size = sizeof(event);
    if (s_isMouseDown)
    {
        event.device_kind = kFlutterPointerDeviceKindTouch;
        event.phase = kMove;
    }
    else
    {
        event.device_kind = kFlutterPointerDeviceKindMouse;
        event.phase = kHover;
    }

    event.x = x;
    event.y = y;

    event.timestamp = getTimeStamp();

    FlutterEngineSendPointerEvent(g_flutterEngine, &event, 1);
    return FlutterEngineGetPointerEventHandled();
}

bool flutterMouseButtonEvent(int32_t x, int32_t y, bool down)
{
    if (g_flutterEngine == nullptr || s_flutterDisableInput)
        return false;

    FlutterPointerEvent event = {};
    event.struct_size = sizeof(event);
    event.device_kind = kFlutterPointerDeviceKindTouch;
    if (down)
    {
        if (s_isMouseDown)
        {
            event.phase = kMove;
        }
        else
        {
            event.phase = kDown;
        }
    }
    else
    {
        if (s_isMouseDown)
        {
            event.phase = kUp;
            s_isMouseDown = false;
        }
        else
        {
            event.device_kind = kFlutterPointerDeviceKindMouse;
            event.phase = kHover;
        }
    }

    event.x = x;
    event.y = y;

    event.timestamp = getTimeStamp();

    FlutterEngineSendPointerEvent(g_flutterEngine, &event, 1);
    bool Handled = FlutterEngineGetPointerEventHandled();
    if (Handled && down)
    {
        s_isMouseDown = true;
    }

    return Handled;
}

bool flutterMouseWheelEvent(int32_t x, int32_t y, int deltaX, int deltaY)
{
    if (g_flutterEngine == nullptr || s_flutterDisableInput)
        return false;

    FlutterPointerEvent event = {};
    event.struct_size = sizeof(event);
    event.x = x;
    event.y = y;
    event.signal_kind = FlutterPointerSignalKind::kFlutterPointerSignalKindScroll;
    event.scroll_delta_x = deltaX;
    event.scroll_delta_y = deltaY;
    if (s_isMouseDown)
    {
        event.device_kind = kFlutterPointerDeviceKindTouch;
        event.phase = kMove;
    }
    else
    {
        event.device_kind = kFlutterPointerDeviceKindMouse;
        event.phase = kHover;
    }

    event.timestamp = getTimeStamp();
    FlutterEngineSendPointerEvent(g_flutterEngine, &event, 1);
    return FlutterEngineGetPointerEventHandled();
}

void flutterSendMessage(const char* channel, const char* message, uint32_t length)
{
    FlutterPlatformMessage platformMessage{};
    platformMessage.struct_size = sizeof(FlutterPlatformMessage);
    platformMessage.channel = channel;
    platformMessage.message = (const uint8_t*)message;
    platformMessage.message_size = length;

    FlutterEngineSendPlatformMessage(g_flutterEngine, &platformMessage);
}

void flutterPrintDartStackTrace()
{
    FlutterEnginePrintDartStackTrace();
}

void flutterPrintStackTrace()
{
    FlutterEnginePrintStackTrace();
}

void flutterPrintStackTraceWithLocals()
{
    FlutterEnginePrintStackTraceWithLocals();
}

int s_stateScopeCount = 0;
DartStateScope::DartStateScope() {
    if (s_stateScopeCount == 0)
    {
        FlutterEngineDartEnterIsolate();
        FlutterEngineDartEnterScope();
    }
    s_stateScopeCount++;
}

DartStateScope::~DartStateScope() {
    s_stateScopeCount--;
    if (s_stateScopeCount == 0)
    {
        FlutterEngineDartExitScope();
        FlutterEngineDartExitIsolate();
    }
}

void setDartFunctionPtr(const char* name, int64_t address)
{
    for (Dart2CppFunction* entry = s_dart2cppFunctionList; entry; entry = entry->next)
    {
        if (strcmp(name, entry->name) == 0)
        {
            *(void**)(entry)->dartFunctionPPtr = (void*)address;
            break;
        }
    }
}
Cpp2Dart(setDartFunctionPtr)

int64_t testDartCallCpp(int64_t i, int64_t j)
{
    UE_LOG(LogTemp, Warning, TEXT("testDartCallCpp %d, %d"), (int)i, (int)j);
    return i + j;
}

Cpp2Dart(testDartCallCpp)

#if FLUTTERUNREAL_WITH_LUA

LuaFunction(dartGC)
{
    DartStateScope scope;
    FlutterEngineExecuteCommand("gc-now", nullptr);
    return 0;
}

LuaFunction(luaGC)
{
    lua_gc(L, LUA_GCCOLLECT);
    return 0;
}

LuaFunction(getFlutterDataPath)
{
    lua_pushlstring(L, g_flutterDataPath.c_str(), g_flutterDataPath.size());
    return 1;
}

LuaFunction(getLuaPath)
{
    lua_pushlstring(L, g_luaPath.c_str(), g_luaPath.size());
    return 1;
}

#endif
