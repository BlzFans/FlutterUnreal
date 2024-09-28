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
	void StartCustomPresent(UGameViewportClient* GameViewport);

	void renderFlutter();

	void InitFlutterEngine(ENamedThreads::Type renderThreadType);
	void InitFlutterEngine_RenderThread();

	void HandleEndPIE(const bool InIsSimulating);

	FRHIViewport* GetRHIViewport() const;
	void SetRHIViewport(FRHIViewport* Viewport);

protected:
	FDelegateHandle ViewportCreatedHandle;

	FDelegateHandle TickDelegateHandle;
	void RegisterTick();
	void UnregisterTick();
	void Tick(float DeltaSeconds);

	FCustomPresentRHIRef CustomPresent;
	FRHIViewport* RHIViewport = nullptr;

	void* FlutterEngineDLLHandle = nullptr;
	FThreadSafeCounter FlutterEngineInitStage;

	TSharedPtr<IInputProcessor> InputProcessor;
};

inline FRHIViewport* FFlutterUnrealModule::GetRHIViewport() const
{
	return RHIViewport;
}

inline void FFlutterUnrealModule::SetRHIViewport(FRHIViewport* Viewport)
{
	RHIViewport = Viewport;
}

extern FFlutterUnrealModule* GFlutterUnrealModule;
