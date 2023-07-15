#pragma once

#include "ThirdParty/flutter_engine/flutter_embedder.h"

#if PLATFORM_WINDOWS || PLATFORM_ANDROID
#include "VulkanPlatform.h"
#include "VulkanRHIPrivate.h"
#include "VulkanPendingState.h"
#include "VulkanContext.h"
#include "VulkanSwapChain.h"

class MyVulkanViewport : public FVulkanViewport
{
public:
    EPixelFormat GetPixelFormat() const
    {
        return PixelFormat;
    }
};

class MyVulkanSwapChain : public FVulkanSwapChain
{
public:
    int32 GetCurrentImageIndex() const
    {
        return CurrentImageIndex;
    }

    VkSwapchainKHR GetVkSwapchain()
    {
        return SwapChain;
    }
};

class MyVulkanDynamicRHI : public FVulkanDynamicRHI
{
public:
    MyVulkanViewport* GetDrawingViewport()
    {
        return (MyVulkanViewport*)DrawingViewport.GetReference();
    }
};

#endif

void flutterEngineInit(const char* command_line);
void flutterEngineShutdown();
void flutterEngineTick();
void flutterEngineRefresh();
void flutterEngineRender();
void flutterEngineResize(int width, int height);

bool flutterKeyEvent(uint16_t key, bool down, bool repeat);
bool flutterRawKeyEvent(uint16_t key, const FModifierKeysState& ModifierKeys, bool down, bool repeat);

bool flutterCharEvent(uint16_t c);
bool flutterHasTextInput();

bool flutterMouseMoveEvent(int32_t x, int32_t y);
bool flutterMouseButtonEvent(int32_t x, int32_t y, bool down);
bool flutterMouseWheelEvent(int32_t x, int32_t y, int deltaX, int deltaY);

void flutterDisableInput(bool disable);

void flutterSendMessage(const char* channel, const char* message, uint32_t length);

void flutterPrintDartStackTrace();
void flutterPrintStackTrace();
void flutterPrintStackTraceWithLocals();

extern struct _FlutterEngine* g_flutterEngine;

struct Cpp2DartFunction
{
    Cpp2DartFunction(void* function, const char* name);

    void* function;
    const char* name;
    Cpp2DartFunction* next;
};

#define Cpp2Dart(name) static Cpp2DartFunction cpp2dart_##name##_entry(name, #name);

class Dart2CppFunction
{
public:
    Dart2CppFunction(void* functionPPtr, const char* funcName);

    void* dartFunctionPPtr;
    const char* name;
    Dart2CppFunction* next;
};

#define Dart2Cpp(name) static Dart2CppFunction dart2cpp_##name##_entry(&name, #name);

struct DartStateScope {
    DartStateScope();
    ~DartStateScope();
};

extern FlutterRendererType g_flutterRendererType;