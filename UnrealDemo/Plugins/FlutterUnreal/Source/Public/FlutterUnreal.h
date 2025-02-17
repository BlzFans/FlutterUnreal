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
	void StartCustomPresent();

	void renderFlutter();

	void InitFlutterEngine(ENamedThreads::Type renderThreadType);
	void InitFlutterEngine_RenderThread();

	void HandleEndPIE(const bool InIsSimulating);

	FRHIViewport* GetRHIViewport() const;

protected:
	FDelegateHandle ViewportCreatedHandle;

	FDelegateHandle TickDelegateHandle;
	void RegisterTick();
	void UnregisterTick();
	void Tick(float DeltaSeconds);

	FCustomPresentRHIRef CustomPresent;

	void* FlutterEngineDLLHandle = nullptr;
	FThreadSafeCounter FlutterEngineInitStage;

	TSharedPtr<IInputProcessor> InputProcessor;

	FSlateRenderer* SlateRenderer = nullptr;
};

extern FFlutterUnrealModule* GFlutterUnrealModule;
