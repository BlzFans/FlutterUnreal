// Copyright Epic Games, Inc. All Rights Reserved.

using System.IO;
#if UE_5_0_OR_LATER
using EpicGames.Core;
#else
using Tools.DotNETCommon;
#endif
using UnrealBuildTool;

public class FlutterUnreal : ModuleRules
{
    public FlutterUnreal(ReadOnlyTargetRules Target) : base(Target)
    {
        PCHUsage = ModuleRules.PCHUsageMode.UseExplicitOrSharedPCHs;
        
        PublicIncludePaths.AddRange(
            new string[] {
                // ... add public include paths required here ...
            }
        );
                
        
        PrivateIncludePaths.AddRange(
            new string[] {
                // ... add other private include paths required here ...
            }
        );
            
        
        PublicDependencyModuleNames.AddRange(
            new string[]
            {
                "Core",
                // ... add other public dependencies that you statically link with here ...
            }
        );
            
        
        PrivateDependencyModuleNames.AddRange(
            new string[]
            {
                "CoreUObject",
                "Engine",
                "RHI",
#if UE_5_0_OR_LATER
                "RHICore",
#endif
                "RenderCore",
                "Slate",
                "SlateCore",
                "Projects",
                "ApplicationCore",
            }
        );

        if (Target.Platform == UnrealTargetPlatform.Win64)
        {
            PrivateDependencyModuleNames.Add("D3D11RHI");
            PrivateDependencyModuleNames.Add("D3D12RHI");
            PrivateDependencyModuleNames.Add("VulkanRHI");
            //PrivateDependencyModuleNames.Add("OpenGLDrv");

            PrivateDependencyModuleNames.AddRange(new string[] { "D3D11RHI" });
            PrivateIncludePaths.AddRange(
                new string[] {
                    Path.GetFullPath(Path.Combine(EngineDirectory, "Source/Runtime/Windows/D3D11RHI/Private")),
                    Path.GetFullPath(Path.Combine(EngineDirectory, "Source/Runtime/Windows/D3D11RHI/Private/Windows")),

                    Path.GetFullPath(Path.Combine(EngineDirectory, "Source/Runtime/D3D12RHI/Private")),
                    Path.GetFullPath(Path.Combine(EngineDirectory, "Source/Runtime/D3D12RHI/Private/Windows")),
#if UE_5_0_OR_LATER
                    Path.GetFullPath(Path.Combine(EngineDirectory, "Source/Runtime/RHICore/Internal")),
#endif
                }
            );
            PrivateIncludePaths.AddRange(
                new string[] {
                    Path.GetFullPath(Path.Combine(EngineDirectory, "Source/Runtime/VulkanRHI/Private")),
                    Path.GetFullPath(Path.Combine(EngineDirectory, "Source/Runtime/VulkanRHI/Private/Windows"))
                }
            );

            AddEngineThirdPartyPrivateStaticDependencies(Target, "DX11");
            AddEngineThirdPartyPrivateStaticDependencies(Target, "DX12");
            AddEngineThirdPartyPrivateStaticDependencies(Target, "Vulkan");
            AddEngineThirdPartyPrivateStaticDependencies(Target, "OpenGL");
            AddEngineThirdPartyPrivateStaticDependencies(Target, "IntelExtensionsFramework");
            AddEngineThirdPartyPrivateStaticDependencies(Target, "NVAftermath");
            AddEngineThirdPartyPrivateStaticDependencies(Target, "NVAPI");

#if !UE_5_0_OR_LATER
            AddEngineThirdPartyPrivateStaticDependencies(Target, "HLMediaLibrary");
#endif

#if !UE_5_4_OR_LATER
            AddEngineThirdPartyPrivateStaticDependencies(Target, "IntelMetricsDiscovery");
#endif

            PrivateDefinitions.Add("__INTEL_COMPILER=0");

            PublicDelayLoadDLLs.Add("flutter_engine.dll");

            PublicAdditionalLibraries.Add(Path.Combine(ModuleDirectory, "ThirdParty/flutter_engine/flutter_engine.dll.lib"));
            RuntimeDependencies.Add(Path.Combine(ModuleDirectory, "ThirdParty/flutter_engine/flutter_engine.dll"), StagedFileType.SystemNonUFS);

            RuntimeDependencies.Add(Path.Combine(ModuleDirectory, "../Resources/data/app.so"), StagedFileType.NonUFS);
            RuntimeDependencies.Add(Path.Combine(ModuleDirectory, "../Resources/data/icudtl.dat"), StagedFileType.NonUFS);
            RuntimeDependencies.Add(Path.Combine(ModuleDirectory, "../Resources/data/flutter_assets/..."), StagedFileType.NonUFS);

#if !UE_5_5_OR_LATER
            bEnableUndefinedIdentifierWarnings = false;
#endif
        }
        else if (Target.Platform == UnrealTargetPlatform.Android)
        {
            PrivateDependencyModuleNames.Add("VulkanRHI");
            PrivateDependencyModuleNames.Add("OpenGLDrv");
        }
        else if (Target.Platform == UnrealTargetPlatform.IOS)
        {
            PrivateDependencyModuleNames.Add("MetalRHI");
        }
        else if (Target.Platform == UnrealTargetPlatform.Mac)
        {
            PrivateDependencyModuleNames.Add("MetalRHI");
            
            string libflutter_engine = Path.Combine(ModuleDirectory, "ThirdParty/flutter_engine/macos/libflutter_engine.dylib");
            PublicAdditionalLibraries.Add(libflutter_engine);
            RuntimeDependencies.Add("$(BinaryOutputDir)/libflutter_engine.dylib", libflutter_engine); //$(TargetOutputDir)

            PrivateIncludePaths.AddRange(
                new string[] {
                    Path.GetFullPath(Path.Combine(EngineDirectory, "Source/Runtime/Apple/MetalRHI/Private")),
                }
            );

#if !UE_5_0_OR_LATER
            PrivateIncludePaths.AddRange(
                new string[] {
                    Path.GetFullPath(Path.Combine(EngineDirectory, "Source/ThirdParty/mtlpp/mtlpp-master-7efad47/src")),
                    Path.GetFullPath(Path.Combine(ModuleDirectory, "ThirdParty/mtlpp/src")),
                }
            );
#endif
            string FrameworkFlutterEmbedder = Path.Combine(ModuleDirectory, "ThirdParty/flutter_engine/macos/FlutterEmbedder.framework");
            //Add contents of framework directory as runtime dependencies
            foreach (string SourcePath in Directory.EnumerateFiles(FrameworkFlutterEmbedder, "*", SearchOption.AllDirectories))
            {
                if (SourcePath.EndsWith(".h"))
                {
                    continue;
                }

                string Path = SourcePath.Replace(FrameworkFlutterEmbedder, "$(BinaryOutputDir)/FlutterEmbedder.framework");
                RuntimeDependencies.Add(Path, SourcePath);
            }

            string FrameworkFlutterMacOS = Path.Combine(ModuleDirectory, "ThirdParty/flutter_engine/macos/FlutterMacOS.framework");
            // Add contents of framework directory as runtime dependencies
            foreach (string SourcePath in Directory.EnumerateFiles(FrameworkFlutterMacOS, "*", SearchOption.AllDirectories))
            {
                if (SourcePath.EndsWith(".h"))
                {
                    continue;
                }

                string Path = SourcePath.Replace(FrameworkFlutterMacOS, "$(BinaryOutputDir)/FlutterMacOS.framework");
                RuntimeDependencies.Add(Path, SourcePath);
            }

            string FrameworkApp = Path.Combine(PluginDirectory, "Resources/data/macos/App.framework");
            // Add contents of framework directory as runtime dependencies
            foreach (string SourcePath in Directory.EnumerateFiles(FrameworkApp, "*", SearchOption.AllDirectories))
            {
                if (SourcePath.EndsWith(".h"))
                {
                    continue;
                }

                string Path = SourcePath.Replace(FrameworkApp, "$(BinaryOutputDir)/App.framework");
                RuntimeDependencies.Add(Path, SourcePath);
            }
        }

        if (Target.bBuildEditor == true)
        {
            PrivateDependencyModuleNames.Add("UnrealEd");
        }

        DynamicallyLoadedModuleNames.AddRange(
            new string[]
            {
                // ... add any modules that your module loads dynamically here ...
            }
        );

        int withLua = GetWithLuaConfig();
        Log.TraceInformation("FLUTTERUNREAL_WITH_LUA={0}", withLua);
        PublicDefinitions.Add("FLUTTERUNREAL_WITH_LUA=" + withLua);
  
        PublicDefinitions.Add("FLUTTERUNREAL_LUA=1"); //Lua
        PublicDefinitions.Add("FLUTTERUNREAL_UNLUA=2"); //UnLua
        PublicDefinitions.Add("FLUTTERUNREAL_SLUA=3"); //sluaunreal

        if (withLua == 2)
        {
            PrivateDependencyModuleNames.Add("Lua");
            PrivateDependencyModuleNames.Add("UnLua");
        }
        else if (withLua == 3)
        {
            PrivateDependencyModuleNames.Add("slua_unreal");
        }
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
