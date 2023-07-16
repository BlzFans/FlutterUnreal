# 1. Build the original Flutter Engine
Reference https://github.com/flutter/flutter/wiki/Compiling-the-engine

Notice: src/flutter must be switched to tag 3.10.5

# 2. Install original Flutter SDK
https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.10.5-stable.zip

# 3. Override some modify to Flutter Engine
Copy FlutterUnreal/Flutter/3.10.5/flutter_src/flutter to the original Flutter Engine src/flutter

Copy FlutterUnreal/Flutter/3.10.5/flutter_src/third_party to the original Flutter Engine src/third_party

Build Flutter Engine 

# 4. Override some modify to Flutter SDK
Copy FlutterUnreal/Flutter/3.10.5/flutter_sdk/packages/flutter/lib/src/gestures/binding.dart to your Flutter SDK path and overwrite it

Copy FlutterUnreal/Flutter/3.10.5/flutter_sdk/packages/flutter/lib/src/services/hardware_keyboard.dart to your Flutter SDK path and overwrite it
