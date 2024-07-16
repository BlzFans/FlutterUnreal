// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "CoreMinimal.h"
#include "Modules/ModuleManager.h"

class FFlutterUnrealModule : public IModuleInterface
{
public:
	/** IModuleInterface implementation */
	virtual void StartupModule() override;
	virtual void ShutdownModule() override;

	void OnViewportCreated();

	void AddWidgetToViewport(UGameViewportClient* GameViewport);
	void StartCustomPresent(UGameViewportClient* GameViewport);

	void EndFrame();

	void InitFlutterEngine(ENamedThreads::Type renderThreadType);
	void InitFlutterEngine_RenderThread();

	void HandleEndPIE(const bool InIsSimulating);

	FRHIViewport* GetViewPortRHI();

protected:
	FDelegateHandle ViewportCreatedHandle;

	FDelegateHandle TickDelegateHandle;
	void RegisterTick();
	void UnregisterTick();
	void Tick(float DeltaSeconds);

	TSharedPtr<class SFlutterWidget> SharedWidget;
	FCustomPresentRHIRef CustomPresent;

	void* FlutterEngineDLLHandle = nullptr;
	FThreadSafeCounter FlutterEngineInitStage;

	FViewportRHIRef ViewportRHI;
};

extern FFlutterUnrealModule* GFlutterUnrealModule;

inline FRHIViewport* FFlutterUnrealModule::GetViewPortRHI()
{
	return ViewportRHI.GetReference();
}
