library flutter_unreal;

import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

import 'package:ffi/ffi.dart';
import 'dart:ffi' as ffi;

part 'lua_utils.dart';
part 'lua.dart';
part 'lua_auto_bind.dart';

@pragma('vm:entry-point')
bool pointerEventHandled = false;

bool hitTestCallback(PointerEvent event, HitTestResult? hitTestResult) {
  if (hitTestResult == null) {
    pointerEventHandled = false;
    return false;
  }

  for (final HitTestEntry entry in hitTestResult.path) {
    if (event is PointerDownEvent) {
      //stderr.writeln("$entry");
    }

    //RenderCustomSingleChildLayoutBox for Tooltip widget
    if (entry.target is RenderBlockPointer || entry.target is RenderCustomSingleChildLayoutBox) {
      //debugPrint("hitTest true");
      pointerEventHandled = true;
      return true;
    }
  }

  //debugPrint("hitTest false");
  pointerEventHandled = false;
  return false;
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static BuildContext context() { return navigatorKey.currentContext!; }
}

class RenderBlockPointer extends RenderProxyBox {
}

class BlockPointer extends SingleChildRenderObjectWidget {
  const BlockPointer({super.key, super.child});

  @override
  RenderBlockPointer createRenderObject(BuildContext context) {
    return RenderBlockPointer();
  }
}

class LStatelessWidget extends StatelessWidget {
  const LStatelessWidget({super.key, required this.builder});

  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return builder(context);
  }
}

typedef StateCreator = State<StatefulWidget> Function();
class LStatefulWidget extends StatefulWidget {
  const LStatefulWidget({super.key, required this.stateCreator});
  final StateCreator stateCreator;

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return stateCreator();
  }
}

class LState extends State<StatefulWidget> {
  LState({required this.builder, this.onInit});

  VoidCallback? onInit;
  WidgetBuilder? builder;

  void markNeedsBuild () {
    setState(() {});
  }

  @override
  void initState() {
    if (onInit != null)  {
      onInit!();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return builder!(context);
  }

  @override
  void dispose() {    
    super.dispose();
    //debugPrint("LState dispose");
    onInit = null;
    builder = null;
  }
}

typedef TextValidateFunction = bool Function(String oldValue, String newValue);
class LTextInputFormatter extends TextInputFormatter
{
  LTextInputFormatter(this.validateFunction);
  final TextValidateFunction? validateFunction;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (validateFunction != null) {
      if (validateFunction!(oldValue.text, newValue.text)) {
        return newValue;
      }

      return oldValue;
    }

    return newValue;
  }
}

Key StringKey(String key) {
  return ValueKey(key);
}

Key IntKey(int key) {
  return ValueKey(key);
}

void markNeedsBuild(BuildContext context) {
  (context as Element).markNeedsBuild();
}

@ffi.Native<ffi.Int64 Function(ffi.Int64, ffi.Int64)>()
external int testDartCallCpp(int a, int b);

void initFlutterUnreal() {
  try {
    onHitTestResult = hitTestCallback;

    assert(
      () {
        stderr.writeln("");
        debugPrint("testDartCallCpp ${testDartCallCpp(2, 3)}");
        debugPrint("testDartCallCpp ${testDartCallCpp(4, 6)}");
        return true;
      }()
    );

    _initLuaUtils();
  } catch (e) {
    //print("initFlutterUnreal: \n $e");
  }
}
