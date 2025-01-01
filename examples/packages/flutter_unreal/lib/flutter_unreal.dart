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

typedef VoidPtr = ffi.Pointer<ffi.Void>;
typedef Utf8Ptr = ffi.Pointer<Utf8>;
typedef Int64Ptr = ffi.Pointer<ffi.Int64>;
typedef Int32Ptr = ffi.Pointer<ffi.Int32>;

@ffi.Native<ffi.Int64 Function(ffi.Int64, ffi.Int64)>()
external int testDartCallCpp(int a, int b);

double _gameViewPosX = 0;
double _gameViewPosY = 0;
double _gameViewWidth = 0;
double _gameViewHeight = 0;

StateSetter? _rebuildGameView;
class GameView extends StatelessWidget {
  GameView({
      super.key,
      required this.child,
  });
  
  final Widget child;
  
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        _rebuildGameView = setState;
      
        if (_gameViewWidth == 0)
        {
          return child;
        }
        
        double dpr = window.devicePixelRatio;
        
        Widget current = child;
        //current = ColoredBox(color: Color(0x4000ff00), child: current);
        current = SizedBox(width: _gameViewWidth / dpr, height: _gameViewHeight / dpr, child: current);
        current = Positioned(left: _gameViewPosX / dpr, top: _gameViewPosY / dpr, child: current);
        current = Stack(textDirection: TextDirection.ltr, children: <Widget>[current]);
        //current = ColoredBox(color: Color(0x20ff0000), child: current);
        
        return current;
      }
    );
  }
}

@ffi.Native<ffi.Void Function(Utf8Ptr name, ffi.Int64 address)>(symbol: 'setDartFunctionPtr')
external void _setDartFunctionPtr(Utf8Ptr name, int address);
void setDartFunctionPtr(String name, int address) {
  final nameUtf8 = name.toNativeUtf8();
  _setDartFunctionPtr(nameUtf8, address);
  malloc.free(nameUtf8);
}

typedef Dart_OnGameViewportResize_Type = ffi.Void Function(ffi.Int32, ffi.Int32, ffi.Int32, ffi.Int32);
void Dart_OnGameViewportResize(int x, int y, int width, int height)
{
  debugPrint("Dart_OnGameViewportResize ${x} ${y} ${width} ${height}");
  _gameViewPosX = x.toDouble();
  _gameViewPosY = y.toDouble();
  _gameViewWidth = width.toDouble();
  _gameViewHeight = height.toDouble();
  _rebuildGameView?.call((){});
}

void initFlutterUnreal() {
  print("Dart Version: ${Platform.version}\n");
  print("Flutter Version: 3.27.1\n");
  try {
    onHitTestResult = hitTestCallback;

    int address;

    address = ffi.Pointer.fromFunction<Dart_OnGameViewportResize_Type>(Dart_OnGameViewportResize).address;
    setDartFunctionPtr('Dart_OnGameViewportResize', address);

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
