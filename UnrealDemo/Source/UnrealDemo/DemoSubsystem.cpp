// Fill out your copyright notice in the Description page of Project Settings.

#include "DemoSubsystem.h"
#include "Misc/Paths.h"
#include "HAL/PlatformFileManager.h"
#include "GenericPlatform/GenericPlatformFile.h"
#include "Misc/FileHelper.h"

#if FLUTTERUNREAL_WITH_LUA == FLUTTERUNREAL_SLUA
#include "slua.h"

NS_SLUA::LuaState* CreateLuaState(UGameInstance* GameInstance)
{
	NS_SLUA::LuaState* state = new NS_SLUA::LuaState("SLuaMainState", GameInstance);
	state->setLoadFileDelegate([](const char* fn, FString& filepath)->TArray<uint8> {

		IPlatformFile& PlatformFile = FPlatformFileManager::Get().GetPlatformFile();
		FString path = FPaths::ProjectContentDir();
		FString filename = UTF8_TO_TCHAR(fn);
		path /= "Lua";
		path /= filename.Replace(TEXT("."), TEXT("/"));

		TArray<uint8> Content;
		TArray<FString> luaExts = { UTF8_TO_TCHAR(".lua"), UTF8_TO_TCHAR(".luac") };
		for (auto& it : luaExts) {
			auto fullPath = path + *it;

			FFileHelper::LoadFileToArray(Content, *fullPath);
			if (Content.Num() > 0) {
				filepath = fullPath;
				return MoveTemp(Content);
			}
		}

		return MoveTemp(Content);
	});
	state->init();

	return state;
}

void CloseLuaState(NS_SLUA::LuaState* state)
{
    if (state)
    {
    	state->close();
		delete state;
    }	
}

#endif

void UDemoSubsystem::Initialize(FSubsystemCollectionBase& Collection)
{
	Super::Initialize(Collection);

#if FLUTTERUNREAL_WITH_LUA == FLUTTERUNREAL_SLUA
	state = CreateLuaState(GetGameInstance());
#endif
}

void UDemoSubsystem::Deinitialize()
{
#if FLUTTERUNREAL_WITH_LUA == FLUTTERUNREAL_SLUA
	CloseLuaState(state);
	state = nullptr;
#endif

	Super::Deinitialize();
}

