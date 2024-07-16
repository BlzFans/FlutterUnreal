
#include "FlutterUnreal.h"
#include "FlutterUnrealCustomPresent.h"
#include "SFlutterWidget.h"
#include "FlutterEmbeder.h"
#include "ThirdParty/flutter_engine/flutter_embedder.h"

#if PLATFORM_WINDOWS
#include "VulkanPlatform.h"
#include "VulkanRHIPrivate.h"
#include "VulkanPendingState.h"
#include "VulkanContext.h"

#include "D3D11RHIPrivate.h"
#include "D3D11Util.h"
#endif

#include "Interfaces/IPluginManager.h"
#include "Async/Async.h"

#define LOCTEXT_NAMESPACE "FFlutterUnrealModule"

FFlutterUnrealModule* GFlutterUnrealModule = nullptr;
void FFlutterUnrealModule::StartupModule()
{
	UE_LOG(LogTemp, Warning, TEXT("FlutterUnreal StartupModule"));
	GFlutterUnrealModule = this;
    ViewportCreatedHandle = UGameViewportClient::OnViewportCreated().AddRaw(this, &FFlutterUnrealModule::OnViewportCreated);

#if WITH_EDITOR
	FDelegateHandle EndPIEdelegate = FEditorDelegates::EndPIE.AddRaw(this, &FFlutterUnrealModule::HandleEndPIE);
#endif
}

void FFlutterUnrealModule::ShutdownModule()
{
	UE_LOG(LogTemp, Warning, TEXT("FlutterUnreal ShutdownModule"));
	if (ViewportCreatedHandle.IsValid())
	{
		UGameViewportClient::OnViewportCreated().Remove(ViewportCreatedHandle);
		ViewportCreatedHandle.Reset();
	}

	ViewportRHI.SafeRelease();
	CustomPresent.SafeRelease();
	SharedWidget.Reset();

#if !WITH_EDITOR
	if (FlutterEngineDLLHandle)
	{
		FPlatformProcess::FreeDllHandle(FlutterEngineDLLHandle);
		FlutterEngineDLLHandle = nullptr;
	}
#endif

	UnregisterTick();
	GFlutterUnrealModule = nullptr;
}

void FFlutterUnrealModule::OnViewportCreated()
{
	UE_LOG(LogTemp, Warning, TEXT("OnViewportCreated"));

	FString RHIName = GDynamicRHI->GetName();
	if (RHIName == TEXT("Vulkan"))
	{
		g_flutterRendererType = kVulkan;
	}
	else if (RHIName == TEXT("OpenGL"))
	{
		g_flutterRendererType = kOpenGL;
	}
	else if (RHIName == TEXT("D3D11"))
	{
		g_flutterRendererType = kD3D11;
	}
	else if (RHIName == TEXT("D3D12"))
	{
		g_flutterRendererType = kD3D12;
	}
	else 
	{
		check(false);
	}

	if (FlutterEngineDLLHandle == nullptr)
	{
		FString DLLPath = IPluginManager::Get().FindPlugin("FlutterUnreal")->GetBaseDir() + "/Source/ThirdParty/flutter_engine/flutter_engine.dll";
		DLLPath = FPaths::ConvertRelativePathToFull(DLLPath);
		UE_LOG(LogTemp, Warning, TEXT("DLLPath %s"), *DLLPath);

		FlutterEngineDLLHandle = FPlatformProcess::GetDllHandle(*DLLPath);
	}

	AddWidgetToViewport(GEngine->GameViewport);
	RegisterTick();

	StartCustomPresent(GEngine->GameViewport); //run in RHIThread
}

#if WITH_EDITOR
void FFlutterUnrealModule::HandleEndPIE(const bool InIsSimulating)
{
	if (SharedWidget.IsValid())
	{
		auto& WidgetGameViewport = SharedWidget->GetGameViewport();
		if (WidgetGameViewport.IsValid())
		{
			WidgetGameViewport->RemoveViewportWidgetContent(SharedWidget.ToSharedRef());
		}
	}

	UnregisterTick();
}
#endif

void FFlutterUnrealModule::StartCustomPresent(UGameViewportClient* GameViewport)
{
	if (!CustomPresent.IsValid())
	{
		FSlateRenderer* Renderer = FSlateApplication::Get().GetRenderer();
		TSharedPtr<SWindow> Window = GameViewport->GetWindow();
		void* ViewportResource = Renderer->GetViewportResource(*Window);

		FViewportRHIRef* viewport_rhi = nullptr;
		if (ViewportResource)
		{
			viewport_rhi = (FViewportRHIRef*)ViewportResource;
		}

		if (viewport_rhi && viewport_rhi->IsValid())
		{
			UE_LOG(LogTemp, Warning, TEXT("FlutterUnreal StartCustomPresent"));
			CustomPresent = new FFlutterUnrealCustomPresent();
			viewport_rhi->GetReference()->SetCustomPresent(CustomPresent);

			if (g_flutterRendererType == kD3D11 || g_flutterRendererType == kD3D12)
			{
				ViewportRHI = *viewport_rhi;
			}
		}
	}
}

void FFlutterUnrealModule::AddWidgetToViewport(UGameViewportClient* GameViewport)
{
	SAssignNew(SharedWidget, SFlutterWidget).GameViewport(GameViewport);
	GameViewport->AddViewportWidgetContent(SharedWidget.ToSharedRef(), 10000);
}

void FFlutterUnrealModule::RegisterTick()
{
	// Slate Post-Tick is a good moment to end and advance ImGui frame as it minimises a tearing.
	if (!TickDelegateHandle.IsValid() && FSlateApplication::IsInitialized())
	{
		TickDelegateHandle = FSlateApplication::Get().OnPostTick().AddRaw(this, &FFlutterUnrealModule::Tick);
	}
}

void FFlutterUnrealModule::UnregisterTick()
{
	if (TickDelegateHandle.IsValid())
	{
		if (FSlateApplication::IsInitialized())
		{
			FSlateApplication::Get().OnPostTick().Remove(TickDelegateHandle);
		}
		TickDelegateHandle.Reset();
	}
}

void FFlutterUnrealModule::Tick(float DeltaSeconds)
{
	flutterEngineTick();
}

void FFlutterUnrealModule::InitFlutterEngine(ENamedThreads::Type renderThreadType)
{
	FlutterEngineInitStage.Increment();

	AsyncTask(renderThreadType, [this]() {
		while (this->FlutterEngineInitStage.GetValue() == 2)
		{
			FlutterEngineRunRenderLoop(); //render loop
			FPlatformProcess::Sleep(0.002f);
		}
	});

	//src/flutter/shell/common/switches.h
	flutterEngineInit(
		"FlutterUnreal::"
		"--verbose-logging=true::"
		"--disable-service-auth-codes=false::"
		"--observatory-host=0.0.0.0::"
		"--observatory-port=12321"
	);

	FlutterEngineInitStage.Increment();
}

void FFlutterUnrealModule::InitFlutterEngine_RenderThread()
{
	if (FlutterEngineInitStage.GetValue() == 0)
	{
		FlutterEngineInitStage.Increment();
		FlutterEngineInitRenderLoop(
			[](void*) -> bool {
				if (!GRenderingThread)
					return false;

				return IsInRenderingThread() || IsInRHIThread();
			}
		);
		ENamedThreads::Type type = FTaskGraphInterface::Get().GetCurrentThreadIfKnown();

		AsyncTask(ENamedThreads::GameThread, [type]() {
			GFlutterUnrealModule->InitFlutterEngine(type);
		});
	}
}

void FFlutterUnrealModule::EndFrame()
{
	if (GEngine->GameViewport == nullptr)
		return;

	InitFlutterEngine_RenderThread();
	if (FlutterEngineInitStage.GetValue() < 3)
	{
		FlutterEngineRunRenderLoop(); //render loop
	}
	else
	{
		flutterEngineRender();

#if PLATFORM_WINDOWS
		if (g_flutterRendererType == kD3D11)
		{
			FD3D11DynamicRHI* d3d11RHI = static_cast<FD3D11DynamicRHI*>(GDynamicRHI);
			d3d11RHI->ClearState();
		}
#endif
	}
}

#undef LOCTEXT_NAMESPACE

IMPLEMENT_MODULE(FFlutterUnrealModule, FlutterUnreal)
