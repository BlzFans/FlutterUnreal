
#include "FlutterUnreal.h"
#include "FlutterUnrealCustomPresent.h"
#include "FlutterInput.h"
#include "FlutterEmbeder.h"
#include "FlutterLua.h"
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
#include "Slate/SceneViewport.h"
#include "Engine/GameEngine.h"

#define LOCTEXT_NAMESPACE "FFlutterUnrealModule"

FFlutterUnrealModule* GFlutterUnrealModule = nullptr;
void FFlutterUnrealModule::StartupModule()
{
	UE_LOG(LogTemp, Warning, TEXT("FlutterUnreal StartupModule"));
	GFlutterUnrealModule = this;

	if (IsRunningDedicatedServer())
		return;

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

	SlateRenderer = nullptr;
	CustomPresent.SafeRelease();

#if !WITH_EDITOR
	if (FlutterEngineDLLHandle)
	{
		FPlatformProcess::FreeDllHandle(FlutterEngineDLLHandle);
		FlutterEngineDLLHandle = nullptr;
	}
#endif

	UnregisterTick();
	GFlutterUnrealModule = nullptr;

	if (InputProcessor.IsValid())
	{
		if (FSlateApplication::IsInitialized())
		{
			FSlateApplication::Get().UnregisterInputPreProcessor(InputProcessor);
		}

		InputProcessor.Reset();
	}
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
	else if (RHIName == TEXT("Metal"))
	{
		g_flutterRendererType = kMetal;
	}
	else 
	{
		check(false);
	}
    
    UE_LOG(LogTemp, Log, TEXT("RHIName %s %d"), *RHIName, (int)g_flutterRendererType);

	if (FlutterEngineDLLHandle == nullptr)
	{
		FString DLLPath = IPluginManager::Get().FindPlugin("FlutterUnreal")->GetBaseDir() + "/Source/ThirdParty/flutter_engine/flutter_engine.dll";
		DLLPath = FPaths::ConvertRelativePathToFull(DLLPath);
		UE_LOG(LogTemp, Log, TEXT("DLLPath %s"), *DLLPath);

		FlutterEngineDLLHandle = FPlatformProcess::GetDllHandle(*DLLPath);
	}

	RegisterTick();

	if (!InputProcessor.IsValid())
	{
		InputProcessor = MakeShareable(new FFluterInputProcessor);
		FSlateApplication::Get().RegisterInputPreProcessor(InputProcessor);
	}

	StartCustomPresent(); //run in RHIThread
}

#if WITH_EDITOR
void FFlutterUnrealModule::HandleEndPIE(const bool InIsSimulating)
{
	UnregisterTick();
}
#endif

void FFlutterUnrealModule::StartCustomPresent()
{
	SlateRenderer = FSlateApplication::Get().GetRenderer();
	if (!CustomPresent.IsValid())
	{
		FRHIViewport* RHIViewport = GetRHIViewport();
		if (RHIViewport)
		{
			UE_LOG(LogTemp, Warning, TEXT("FlutterUnreal StartCustomPresent"));
			CustomPresent = new FFlutterUnrealCustomPresent();
			RHIViewport->SetCustomPresent(CustomPresent);
		}
	}
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
#if FLUTTERUNREAL_WITH_LUA == FLUTTERUNREAL_SLUA
	if (LuaState::get() == nullptr)
	{
		AsyncTask(ENamedThreads::GameThread, [renderThreadType]() {
			GFlutterUnrealModule->InitFlutterEngine(renderThreadType);
		});
		return;
	}
#endif

	FlutterEngineInitStage.Increment(); //2

	AsyncTask(renderThreadType, [this]() {
		while (this->FlutterEngineInitStage.GetValue() == 2)
		{
			FlutterEngineRunRenderLoop(); //run expired flutter tasks
			FPlatformProcess::Sleep(0.002f);
		}
	});

	//debug dart:
	//Execute the following command in the directory where main.dart is located
	//flutter.bat attach -d windows --debug-url http://127.0.0.1:12321 

	//src/flutter/shell/common/switches.h
	flutterEngineInit(
		"FlutterUnreal::"
		"--verbose-logging=true::"
		"--disable-service-auth-codes=false::"
		"--observatory-host=0.0.0.0::"
		"--observatory-port=12321"
	);

	FlutterEngineInitStage.Increment(); //3
}

void FFlutterUnrealModule::InitFlutterEngine_RenderThread()
{
	if (FlutterEngineInitStage.GetValue() == 0) //0
	{
		FlutterEngineInitStage.Increment();     //1
		FlutterEngineInitRenderLoop(
			[](void*) -> bool {
				if (!GIsThreadedRendering)
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

void FFlutterUnrealModule::renderFlutter()
{
	if (GEngine->GameViewport == nullptr)
		return;

	InitFlutterEngine_RenderThread();
	if (FlutterEngineInitStage.GetValue() < 3)
	{
		FlutterEngineRunRenderLoop(); //run expired flutter tasks
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

FRHIViewport* FFlutterUnrealModule::GetRHIViewport() const
{
	if (SlateRenderer == nullptr)
		return nullptr;

	TSharedPtr<SWindow> Window = FGlobalTabmanager::Get()->GetRootWindow();
	if (!Window.IsValid())
	{
		if (GEngine->GameViewport)
			Window = GEngine->GameViewport->GetWindow();
	}

	if (!Window.IsValid())
	{
		UGameEngine* GameEngine = Cast<UGameEngine>(GEngine);
		if (GameEngine)
			Window = GameEngine->GameViewportWindow.Pin();
	}

	if (!Window.IsValid())
	{
		UE_LOG(LogTemp, Warning, TEXT("GetRHIViewport: Cannot find the window"));
		return nullptr;
	}

	void* ViewportResource = SlateRenderer->GetViewportResource(*Window);
	if (ViewportResource)
	{
		FViewportRHIRef* ViewportRHIRef = (FViewportRHIRef*)ViewportResource;
		return ViewportRHIRef->GetReference();
	}

	return nullptr;
}

#undef LOCTEXT_NAMESPACE

IMPLEMENT_MODULE(FFlutterUnrealModule, FlutterUnreal)
