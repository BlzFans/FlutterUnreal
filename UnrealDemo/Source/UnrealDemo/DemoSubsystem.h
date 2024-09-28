// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "Subsystems/GameInstanceSubsystem.h"
#include "DemoSubsystem.generated.h"

#if FLUTTERUNREAL_WITH_LUA == FLUTTERUNREAL_SLUA
namespace NS_SLUA {
	class LuaState;
}
#endif

UCLASS()
class UDemoSubsystem : public UGameInstanceSubsystem
{
	GENERATED_BODY()
	
public:
	virtual void Initialize(FSubsystemCollectionBase& Collection);
	virtual void Deinitialize();

#if FLUTTERUNREAL_WITH_LUA == FLUTTERUNREAL_SLUA
	NS_SLUA::LuaState* state;
#endif
};
