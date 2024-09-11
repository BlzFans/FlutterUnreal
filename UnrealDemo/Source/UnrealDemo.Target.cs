// Copyright Epic Games, Inc. All Rights Reserved.

using UnrealBuildTool;
using System.Collections.Generic;

public class UnrealDemoTarget : TargetRules
{
	public UnrealDemoTarget( TargetInfo Target) : base(Target)
	{
		Type = TargetType.Game;
#if UE_5_4_OR_LATER
		DefaultBuildSettings = BuildSettingsVersion.V5;
        IncludeOrderVersion = EngineIncludeOrderVersion.Latest;
#elif UE_5_0_OR_LATER
		DefaultBuildSettings = BuildSettingsVersion.V4;
        IncludeOrderVersion = EngineIncludeOrderVersion.Latest;
#else
        DefaultBuildSettings = BuildSettingsVersion.V2;
#endif
        ExtraModuleNames.AddRange( new string[] { "UnrealDemo" } );
        
    }
}
