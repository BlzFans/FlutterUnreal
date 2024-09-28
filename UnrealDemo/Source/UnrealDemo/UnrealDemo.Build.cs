// Copyright Epic Games, Inc. All Rights Reserved.

using EpicGames.Core;
using UnrealBuildTool;

public class UnrealDemo : ModuleRules
{
	public UnrealDemo(ReadOnlyTargetRules Target) : base(Target)
	{
		PCHUsage = PCHUsageMode.UseExplicitOrSharedPCHs;
	
		PublicDependencyModuleNames.AddRange(new string[] { "Core", "CoreUObject", "Engine", "InputCore" });

        PrivateDependencyModuleNames.Add("FlutterUnreal");
        int withLua = GetWithLuaConfig();
        if (withLua == 3)
        {
            PrivateDependencyModuleNames.Add("slua_unreal");
        }

        // Uncomment if you are using Slate UI
        // PrivateDependencyModuleNames.AddRange(new string[] { "Slate", "SlateCore" });

        // Uncomment if you are using online features
        // PrivateDependencyModuleNames.Add("OnlineSubsystem");

        // To include OnlineSubsystemSteam, add it to the plugins section in your uproject file with the Enabled attribute set to true
    }

    private int GetWithLuaConfig()
    {
        var projectDir = Target.ProjectFile.Directory;
        var configFilePath = projectDir + "/Config/FlutterUnreal.ini";
        var configFileReference = new FileReference(configFilePath);
        var configFile = FileReference.Exists(configFileReference) ? new ConfigFile(configFileReference) : new ConfigFile();
        var config = new ConfigHierarchy(new[] { configFile });
        const string section = "/FlutterUnreal";

        int withLua;
        if (config.GetInt32(section, "WithLua", out withLua))
            return withLua;

        return 1;
    }
}
