
#include "FlutterUnrealCustomPresent.h"
#include "FlutterUnreal.h"
#include "FlutterEmbeder.h"

void FFlutterUnrealCustomPresent::BeginDrawing()
{
#if PLATFORM_WINDOWS
	extern void OnBeginDrawing();
	OnBeginDrawing();
#endif
}

bool FFlutterUnrealCustomPresent::Present(int32& InOutSyncInterval)
{
#if PLATFORM_WINDOWS || PLATFORM_ANDROID
	if (g_flutterRendererType == kVulkan)
	{
		MyVulkanViewport* Viewport = ((MyVulkanDynamicRHI*)GVulkanRHI)->GetDrawingViewport();
		MyVulkanSwapChain* SwapChain = (MyVulkanSwapChain*)Viewport->GetSwapChain();
		mSwapchain = SwapChain->GetVkSwapchain();
	}
#endif

	GFlutterUnrealModule->EndFrame();
	return true;
}

void FFlutterUnrealCustomPresent::PostPresent()
{
#if PLATFORM_WINDOWS || PLATFORM_ANDROID
	if (g_flutterRendererType == kVulkan && mSwapchain)
	{
		MyVulkanViewport* Viewport = ((MyVulkanDynamicRHI*)GVulkanRHI)->GetDrawingViewport();
		MyVulkanSwapChain* SwapChain = (MyVulkanSwapChain*)Viewport->GetSwapChain();
		//device lost
		if (mSwapchain != SwapChain->GetVkSwapchain())
		{
			FlutterEngineResetLastTree(g_flutterEngine);
		}

		mSwapchain = nullptr;
	}
#endif 

#if PLATFORM_WINDOWS
	GFlutterUnrealModule->SetRHIViewport(nullptr);
#endif
}
