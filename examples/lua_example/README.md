
run the following command
1. flutter.bat build windows
2. xcopy /S /Y build\windows\x64\runner\Release\data ..\..\UnrealDemo\Plugins\FlutterUnreal\Resources\data
3. del ..\..\UnrealDemo\Plugins\FlutterUnreal\Resources\data\flutter_assets\lua\ts_main.lua (if exist)
