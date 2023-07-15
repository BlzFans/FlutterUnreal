
import 'package:flutter_unreal/flutter_unreal.dart';
import 'dart:ffi' as ffi;

import 'package:next_gen_ui_demo/main.dart';

int _nextGenAppMain(VoidPtr L) {
  luaPush(L, nextGenAppMain());
  return 1;
}

void main() {
  initFlutterUnreal();

  int address;
  address = ffi.Pointer.fromFunction<lua_CFunction>(_nextGenAppMain, exceptionalReturn).address;
  luaRegisterFunction(g_L, 'nextGenAppMain', address);

  dostring(g_L, "package.path = '?.lua;' .. getLuaPath() .. '/?.lua'");
  dostring(g_L, "require 'main'");
}
