part of flutter_unreal;

late final VoidPtr g_L;

@ffi.Native<ffi.Void Function(VoidPtr, ffi.Int64, ffi.Int32)>(symbol: 'luaPushObject')
external void _luaPushObject(VoidPtr L, int id, int metaTable);

@ffi.Native<ffi.Int64 Function(VoidPtr, ffi.Int32)>(symbol: 'luaToObject')
external int _luaToObject(VoidPtr L, int idx);

int _nextId = 0;

var _idToObject = <int, Object>{};
var _idToObjectWeak = <int, WeakReference<Object>>{};
var _metaTable = <String, int>{}; 

int luaPushObject(VoidPtr L, Object? obj) {
  if (obj != null) {
    _nextId = _nextId + 1;
    int id = _nextId;

    _idToObject[id] = obj;

    String type = obj.runtimeType.toString();
    int metaTable = luaGetMetaTable(L, type);
    _luaPushObject(L, id, metaTable);
  } else {
    lua_pushnil(L);
  }

  return 1;
}

int luaGetMetaTable(VoidPtr L, String type) {
  int? ref = _metaTable[type];
  if (ref != null) {
    return ref;
  }

  int ltype = luaGetValue(L, type);
  if (ltype != LUA_TTABLE) {
    lua_pop(L, 1);
    ltype = luaGetValue(L, "Object");
  }

  assert(ltype == LUA_TTABLE);
  ref = luaL_ref(L, LUA_REGISTRYINDEX);
  _metaTable[type] = ref;
  return ref;
}

Object? luaToObject(VoidPtr L, int idx) {
  if (lua_type(L, idx) != LUA_TUSERDATA) {
    debugPrint("luaToObject null object ${lua_type(L, idx)}");
    return null;
  }

  int id = _luaToObject(L, idx);
  var object = _idToObject[id];
  object ??= _idToObjectWeak[id]?.target;
  if (object != null) {
    return object;
  }

  debugPrint("luaToObject null object $id");
  return null;
}

T? luaToObjectT<T>(VoidPtr L, int idx) {
  var obj = luaToObject(L, idx);
  if (obj != null) {
    if (obj is T) {
      return obj as T;
    }
  }
  
  return null;
}

@ffi.Native<ffi.Int32 Function(VoidPtr, Utf8Ptr)>(symbol: 'luaGetValue')
external int _luaGetValue(VoidPtr L, Utf8Ptr str);

@ffi.Native<ffi.Void Function(VoidPtr, Utf8Ptr)>(symbol: 'luaSetValue')
external void _luaSetValue(VoidPtr L, Utf8Ptr str);

@ffi.Native<ffi.Void Function(VoidPtr, Utf8Ptr)>(symbol: 'dostring')
external void _dostring(VoidPtr L, Utf8Ptr str);

void dostring(VoidPtr L, String string) {
  final strUtf8 = string.toNativeUtf8();
  _dostring(L, strUtf8);
  malloc.free(strUtf8);
}

T? luaCall<T>(VoidPtr L, Object func, [List<Object>? args])
{
  int top = lua_gettop(L);

  try {
    lua_pushnil(L);
    int errfunc = lua_gettop(L);

    int ltype = LUA_TNONE;
    if (func is String) {
      ltype = luaGetValue(L, func);
    } else if (func is int) {
      lua_rawgeti(L, LUA_REGISTRYINDEX, func);
      ltype = lua_type(L, -1);
    } else {
      return null;
    }

    if (ltype != LUA_TFUNCTION) {
      debugPrint("luaCall $func isn't a function");
      return null;
    }

    assert(top + 2 == lua_gettop(L));

    int argLength = 0;
    if (args != null) {
      argLength = args.length;
      for (var arg in args) {
        luaPush(L, arg);
      }
    }

    assert(top + 2 + argLength == lua_gettop(L));

    int ret = lua_pcall(L, argLength, 1, errfunc);
    if (ret == LUA_OK) {
      //if T isn't void
      if (T != dynamic) {
        return luaTo<T>(L, -1);
      }
    }

    return null;
  }
  catch (e, stacktrace) {
    debugPrint(e.toString());
    debugPrint(stacktrace.toString());
  } 
  finally {
    lua_settop(L, top);
  }

  return null;
}

int luaGetValue(VoidPtr L, String name) {
  final nameUtf8 = name.toNativeUtf8();
  int type = _luaGetValue(L, nameUtf8);
  malloc.free(nameUtf8);
  return type;
}

void luaSetValue(VoidPtr L, String name) {
  final nameUtf8 = name.toNativeUtf8();
  _luaSetValue(L, nameUtf8);
  malloc.free(nameUtf8);
}

void luaAlias(VoidPtr L, String name, String value) {
  luaGetValue(L, value);
  luaSetValue(L, name);
}

void luaPushString(VoidPtr L, String v) {
    final units = utf8.encode(v);
    final ffi.Pointer<ffi.Uint8> result = malloc<ffi.Uint8>(units.length);
    final Uint8List nativeString = result.asTypedList(units.length);
    nativeString.setAll(0, units);
    lua_pushlstring(L, result.cast<Utf8>(), units.length);  
    malloc.free(result);
}

int luaGetInt(VoidPtr L, String name)
{
  int ltype = luaGetValue(L, name);
  assert(ltype == LUA_TNUMBER || ltype == LUA_TSTRING);
  var v = luaL_checkinteger(L, -1); 
  lua_pop(L, 1);

  return v;
}

double luaGetDouble(VoidPtr L, String name)
{
  int ltype = luaGetValue(L, name);
  assert(ltype == LUA_TNUMBER || ltype == LUA_TSTRING);
  var v = luaL_checknumber(L, -1); 
  lua_pop(L, 1);

  return v;
}

bool luaGetBool(VoidPtr L, String name)
{
  luaGetValue(L, name);
  var v = luaL_checkboolean(L, -1); 
  lua_pop(L, 1);

  return v;
}

String luaGetString(VoidPtr L, String name)
{
  int ltype = luaGetValue(L, name);
  assert(ltype == LUA_TNUMBER || ltype == LUA_TSTRING);
  var v = luaL_checkstring(L, -1).toDartString(); 
  lua_pop(L, 1);

  return v;
}

void luaSetInt(VoidPtr L, String name, int v)
{
  lua_pushinteger(L, v);
  luaSetValue(L, name);
}

void luaSetDouble(VoidPtr L, String name, double v)
{
  lua_pushnumber(L, v);
  luaSetValue(L, name);
}

void luaSetBool(VoidPtr L, String name, bool v)
{
  lua_pushboolean(L, v);
  luaSetValue(L, name);
}

void luaSetString(VoidPtr L, String name, String v)
{
  luaPushString(L, v);
  luaSetValue(L, name);
}

void luaSetObject(VoidPtr L, String name, Object o) {
  luaPushObject(L, o);
  luaSetValue(L, name);
}

@ffi.Native<VoidPtr Function()>()
external VoidPtr luaGetGlobalState();

void luaPushSet(VoidPtr L, Object? obj) {
  if (obj != null) {
    var set = obj as Set;
    lua_createtable(L, set.length, 0);
    int i = 1;
    for (var element in set) {
      luaPush(L, element);
      lua_rawseti(L, -2, i);
      i++;
    }
  } else {
    lua_createtable(L, 0, 0);
  }
}

void luaPushList(VoidPtr L, Object? obj) {
  if (obj != null) {
    var list = obj as List;
    lua_createtable(L, list.length, 0);
    int i = 1;
    for (var element in list) {
      luaPush(L, element);
      lua_rawseti(L, -2, i);
      i++;
    }
  } else {
    lua_createtable(L, 0, 0);
  }
}

void luaPushMap(VoidPtr L, Object? obj) {
  if (obj != null) {
    var map = obj as Map;
    lua_createtable(L, 0, map.length);
    for (var item in map.entries) {
      luaPush(L, item.key);
      luaPush(L, item.value);
      lua_rawset(L, -3);
    }
  } else {
    lua_createtable(L, 0, 0);
  }
}

int luaPush(VoidPtr L, Object? obj) {
  switch (obj.runtimeType) {
    case int: lua_pushinteger(L, obj as int); break;
    case double: lua_pushnumber(L, obj as double); break;
    case String: luaPushString(L, obj as String); break;
    case bool: lua_pushboolean(L, obj as bool); break;
    default:
      if (obj == null) {
        lua_pushnil(L);
      } else if (obj is Set) {
        luaPushSet(L, obj);
      } else if (obj is List) {
        luaPushList(L, obj);
      } else if (obj is Map) {
        luaPushMap(L, obj);
      } else  {
        luaPushObject(L, obj);
      }
      break;
  }

  return 1;
}

T? luaTo<T>(VoidPtr L, int idx) {
  int top = lua_gettop(L);
  if (lua_absindex(L, idx) > top) {
    return null;
  }

  int type = lua_type(L, idx);
  if (type == LUA_TNONE) {
    return null;
  }

  if (T == int) {
    if (type == LUA_TNUMBER) {
      return lua_tointeger(L, idx) as T;
    }

    return null;
  }
  
  if (T == bool) {
    if (type == LUA_TBOOLEAN) {
      return (lua_toboolean(L, idx) == 0 ? false : true) as T;
    }

    return null;
  }

  if (T == double) {
    if (type == LUA_TNUMBER) {
      return lua_tonumber(L, idx) as T;
    }

    return null;
  }

  if (T == String) {
    if (type == LUA_TSTRING) {
      return lua_tostring(L, idx).toDartString() as T;
    }

    return null;
  }

  if (type == LUA_TUSERDATA) {
    return luaToObjectT<T>(L, idx);
  }

  if (T == dynamic || T == Object) {
    if (type == LUA_TNUMBER) {
      return lua_tonumber(L, idx) as T;
    }

    if (type == LUA_TSTRING) {
      return lua_tostring(L, idx).toDartString() as T;
    }

    if (type == LUA_TBOOLEAN) {
      return (lua_toboolean(L, idx) == 0 ? false : true) as T;
    }
  } else if (T == List<Object>) {
    return luaToList<Object>(L, idx) as T;
  }

  return null;
}

typedef voidType = ffi.Void Function();
typedef voidIType = ffi.Void Function(ffi.Int64);

List<T>? luaToList<T>(VoidPtr L, int idx) {
  if (lua_type(L, idx) != LUA_TTABLE) {
    return null;
  }

  int len = lua_rawlen(L, idx);
  var list = <T>[];
  for (int i = 1; i <= len; i++) {
    lua_rawgeti(L, idx, i);
    T? obj = luaTo<T>(L, -1);
    if (obj != null) {
      list.add(obj);
    }
    lua_pop(L, 1);
  }
  
  return list;
}

Map<U, V>? luaToMap<U, V>(VoidPtr L, int idx) {
  if (lua_type(L, idx) != LUA_TTABLE) {
    return null;
  }

  var map = <U, V>{};
  lua_pushvalue(L, idx);                   //[table]
  lua_pushnil(L);                          //[table nil]
  while (lua_next(L, -2) != 0) {           //[table key value]
    lua_pushvalue(L, -2);                  //[table key value key]

    U? key = luaTo<U>(L, -1);
    V? value = luaTo<V>(L, -2);
    if (key != null && value != null) {
      map[key] = value;
    }

    lua_pop(L, 2);                          //[table key]
  }
                                             //[table]
  lua_pop(L, 1);                            //[]

  return map;
}

typedef lua_CFunction = ffi.Int64 Function(VoidPtr);

int testLuaCallDart(VoidPtr L) {
  try {
    var a = luaL_checkinteger(L, 1);
    var b = luaL_checkinteger(L, 2);
    debugPrint("testLuaCallDart $a $b");
    lua_pushinteger(L, a + b);
    return 1;
  } catch (e) {
    luaL_error(L, e.toString());
    return 0;
  }
}

@ffi.Native<ffi.Void Function(VoidPtr, Utf8Ptr, Utf8Ptr, ffi.Int64, ffi.Int64)>(symbol: 'luaRegisterClass')
external void _luaRegisterClass(VoidPtr L, Utf8Ptr className, Utf8Ptr superClass, int getProp, int setProp);

void luaRegisterClass(VoidPtr L, String className, String superClass, int getProp, int setProp) {
  final classNameUtf8 = className.toNativeUtf8();
  final superClassUtf8 = superClass.toNativeUtf8();
  _luaRegisterClass(L, classNameUtf8, superClassUtf8, getProp, setProp);
  malloc.free(superClassUtf8);
  malloc.free(classNameUtf8);
}

const int exceptionalReturn = -1;

@ffi.Native<ffi.Void Function(VoidPtr, Utf8Ptr, Utf8Ptr, ffi.Int64)>(symbol: 'luaRegisterMethod')
external void _luaRegisterMethod(VoidPtr L, Utf8Ptr className, Utf8Ptr method, int address);

void luaRegisterMethod(VoidPtr L, String className, String method, int address) {
  final classNameUtf8 = className.toNativeUtf8();
  final methodUtf8 = method.toNativeUtf8();
  _luaRegisterMethod(L, classNameUtf8, methodUtf8, address);
  malloc.free(methodUtf8);
  malloc.free(classNameUtf8);
}

@ffi.Native<ffi.Void Function(VoidPtr, Utf8Ptr, ffi.Int64)>(symbol: 'luaRegisterFunction')
external void _luaRegisterFunction(VoidPtr L, Utf8Ptr funciton, int address);

void luaRegisterFunction(VoidPtr L, String function, int address) {
  final functionUtf8 = function.toNativeUtf8();
  _luaRegisterFunction(L, functionUtf8, address);
  malloc.free(functionUtf8);
}

void luaRegisterEnum(VoidPtr L, Type type, List<Enum> values) {
  for (var e in values) {
    luaSetObject(L, "${type.toString()}.${e.name}", e);
  }
}

//positionalArguments
T? _getParam<T>(VoidPtr L, int idx) {
  int top = lua_gettop(L);
  if (lua_absindex(L, idx) > top) {
    return null;
  }

  int type = lua_type(L, idx);
  if (type == LUA_TTABLE) {
    return null;
  }

  return luaTo<T>(L, idx);
}

List<T>? _getListParam<T>(VoidPtr L, int idx) {
  int top = lua_gettop(L);
  if (lua_absindex(L, idx) > top) {
    return null;
  }

  int type = lua_type(L, idx);
  if (type != LUA_TTABLE) {
    return null;
  }

  List<T>? list = luaToList<T>(L, idx);
  lua_pop(L, 1);
  return list;
}

//namedArguments
T? _getNamedParam<T>(VoidPtr L, int idx, String name) {
  int top = lua_gettop(L);
  if (lua_absindex(L, idx) > top) {
    return null;
  }

  int type = lua_type(L, idx);
  if (type != LUA_TTABLE) {
    return null;
  }

  Utf8Ptr nameUtf8 = name.toNativeUtf8();
  type = lua_getfield(L, idx, nameUtf8);
  malloc.free(nameUtf8);

  if (type == LUA_TNONE || type == LUA_TNIL) {
    return null;
  }

  T? value = luaTo<T>(L, -1);
  lua_pop(L, 1);
  return value;
}

List<T>? _getNamedListParam<T>(VoidPtr L, int idx, String name) {
  int top = lua_gettop(L);
  if (lua_absindex(L, idx) > top) {
    return null;
  }

  int type = lua_type(L, idx);
  if (type != LUA_TTABLE) {
    return null;
  }

  Utf8Ptr nameUtf8 = name.toNativeUtf8();
  lua_getfield(L, idx, nameUtf8);
  malloc.free(nameUtf8);

  List<T>? list = luaToList<T>(L, -1);
  lua_pop(L, 1);
  return list;
}

Set<T>? _getNamedSetParam<T>(VoidPtr L, int idx, String name) {
  List<T>? list = _getNamedListParam<T>(L, idx, name);
  if (list != null) {
    return list.toSet();
  }

  return null;
}

Map<U, V>? _getNamedMapParam<U, V>(VoidPtr L, int idx, String name) {
  int top = lua_gettop(L);
  if (lua_absindex(L, idx) > top) {
    return null;
  }

  int type = lua_type(L, idx);
  if (type != LUA_TTABLE) {
    return null;
  }

  Utf8Ptr nameUtf8 = name.toNativeUtf8();
  lua_getfield(L, idx, nameUtf8);
  malloc.free(nameUtf8);

  Map<U, V>? map = luaToMap<U, V>(L, -1);
  lua_pop(L, 1);
  return map;
}

/*
void dumpTable(VoidPtr L, int index) {
  lua_pushvalue(L, index);
  lua_pushnil(L);
  while (lua_next(L, -2) != 0) {
    lua_pushvalue(L, -2);
    debugPrint("table ${luaL_checkstring(L, -1).toDartString()}");
    lua_pop(L, 2);
  }
  lua_pop(L, 1);
}
*/

class LuaCallback {
  final int? _luaRef;
  final _objects = <Object>{};
  String? stack;

  LuaCallback(this._luaRef);  
  T invoke<T>(VoidPtr L, [List<Object>? args]) {
    if (_luaRef != null) {
      return luaCall<T>(L, _luaRef!, args) as T;
    }

    return null as T;
  }

  void breakCircularReference(VoidPtr L) {
    if (_luaRef == LUA_REFNIL) {
      return;
    }

    lua_rawgeti(L, LUA_REGISTRYINDEX, _luaRef!);
    for (int n = 1; ; n++) {
      if (lua_getupvalue(L, -1, n) != ffi.nullptr) {
        int type = lua_type(L, -1);
        if (type == LUA_TUSERDATA) {
          int id = _luaToObject(L, -1);
          Object? obj = _idToObject[id];
          if (obj != null) {
            if (obj is BuildContext || obj is LState) {
              //debugPrint("move upvalue $n $id from lua to dart");
              _objects.add(obj);
              _idToObject.remove(id);
              _idToObjectWeak[id] = WeakReference(obj);
            }
          }
        }

        lua_pop(L, 1);
      } else {
        break;
      }
    }

    lua_pop(L, 1);
  }
}

final Finalizer<int> _callbackFinalizer = Finalizer((ref) {
  //debugPrint("lua unref $ref");
  if (ref != LUA_REFNIL) {
    luaL_unref(g_L, LUA_REGISTRYINDEX, ref);
  }
});

final _callbackList = <WeakReference<LuaCallback>>{};
int break_circular_reference(VoidPtr L) {
  _callbackList.removeWhere((element) => element.target == null);
  for (var obj in _callbackList) {
    obj.target!.breakCircularReference(L);
  }

  return 0;
}

int getLuaCallbackCount(VoidPtr L) {
    lua_pushinteger(L, _callbackList.length);
    return 1;
}

int dumpLuaCallback(VoidPtr L) {
  String stacks = "";
  int i = 1;
  for (var cb in _callbackList) {
    var stack = cb.target?.stack;
    stacks += "$i $stack\n";
    i++;
  }

  luaPushString(L, stacks);
  return 1;
}

LuaCallback? _getLuaCallback(VoidPtr L, int idx, String? name) {
  int top = lua_gettop(L);
  if (lua_absindex(L, idx) > top) {
    return null;
  }

  int type = lua_type(L, idx);
  if (name != null) {
    if (type != LUA_TTABLE) {
      return null;
    }

    Utf8Ptr nameUtf8 = name.toNativeUtf8();
    type = lua_getfield(L, idx, nameUtf8);
    malloc.free(nameUtf8);
  } else {
    if (type == LUA_TNONE) {
      return null;
    }

    lua_pushvalue(L, idx);
  }

  if (type == LUA_TFUNCTION) {
    int ref = luaL_ref(L, LUA_REGISTRYINDEX);
    if (ref != LUA_REFNIL) {
      var callback = LuaCallback(ref);
      _callbackFinalizer.attach(callback, ref, detach:callback);
      _callbackList.add(WeakReference(callback));

      assert(() {
        luaL_traceback(g_L, g_L, ffi.nullptr, 0);
        callback.stack = "callback: $name \n ${lua_tostring(g_L, -1).toDartString()} \n";
        lua_pop(g_L, 1);
        
        return true;
      } ());

      return callback;
    }
  } else {
    lua_pop(L, 1);
  }

  return null;
}

VoidCallback? _getVoidCallback(VoidPtr L, int idx, String? name) {
  var callback = _getLuaCallback(L, idx, name);
  if (callback == null) {
    return null;
  }

  return () {
    callback.invoke(L);
  };
}

RouteFactory? _getRouteFactory(VoidPtr L, int idx, String? name) {
  var callback = _getLuaCallback(L, idx, name);
  if (callback == null) {
    return null;
  }

  return (RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => callback.invoke<Widget>(L, [settings.name!]),
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    );
  };
}

WidgetBuilder? _getWidgetBuilder(VoidPtr L, int idx, String? name) {
  var callback = _getLuaCallback(L, idx, name);
  if (callback == null) {
    return null;
  }

  return (BuildContext context) {
    return callback.invoke<Widget>(L, [context]);
  };
}

StatefulWidgetBuilder? _getStatefulWidgetBuilder(VoidPtr L, int idx, String? name) {
  var callback = _getLuaCallback(L, idx, name);
  if (callback == null) {
    return null;
  }

  return (BuildContext context, StateSetter setState) {
    return callback.invoke<Widget>(L, [context, setState]);
  };
}

typedef LayoutWidgetBuilder =  Widget Function(BuildContext context, BoxConstraints constraints);

LayoutWidgetBuilder? _getLayoutWidgetBuilder(VoidPtr L, int idx, String? name) {
  var callback = _getLuaCallback(L, idx, name);
  if (callback == null) {
    return null;
  }

  return (BuildContext context, BoxConstraints constraints) {
    return callback.invoke<Widget>(L, [context, constraints]);
  };
}

StateCreator? _getStateCreator(VoidPtr L, int idx, String? name){
  var callback = _getLuaCallback(L, idx, name);
  if (callback == null) {
    return null;
  }

  return () {
    return callback.invoke<LState>(L);
  };
}

typedef StringValueChanged = void Function(String value);

typedef BoolValueChanged = void Function(bool? value);
typedef DoubleValueChanged = void Function(double value);
typedef IntValueChanged = void Function(int value);

TextValidateFunction? _getValidateFunction(VoidPtr L, int idx, String? name) {
  var callback = _getLuaCallback(L, idx, name);
  if (callback == null) {
    return null;
  }

  return (String oldValue, String newValue) {
      return callback.invoke<bool>(L, [oldValue, newValue]);
  };
}

DraggableCanceledCallback? _getDraggableCanceledCallback(VoidPtr L, int idx, String? name) {
  var callback = _getLuaCallback(L, idx, name);
  if (callback == null) {
    return null;
  }

  return (Velocity velocity, Offset offset) {
    callback.invoke(L, [velocity, offset]);
  };
}

void Function(T value)? _getVoidCallbackT<T extends Object>(VoidPtr L, int idx, String? name) {
  var callback = _getLuaCallback(L, idx, name);
  if (callback == null) {
    return null;
  }

  return (T value) {
      callback.invoke<void>(L, [value]);
  };
}

void Function(T? value)? _getVoidCallbackT2<T extends Object>(VoidPtr L, int idx, String? name) {
  var callback = _getLuaCallback(L, idx, name);
  if (callback == null) {
    return null;
  }

  return (T? value) {
      if (value != null) {
        callback.invoke<void>(L, [value]);
      } else {
        callback.invoke<void>(L);
      }
  };
}

typedef DynamicCallback = Function(dynamic value);
DynamicCallback? _getDynamicCallback(VoidPtr L, int idx, String? name) {
  var callback = _getLuaCallback(L, idx, name);
  if (callback == null) {
    return null;
  }

  return (dynamic value) {
      if (value != null) {
        callback.invoke<void>(L, [value]);
      }
      else {
        callback.invoke<void>(L);
      }
  };
}

PopupMenuItemBuilder<int>? _getPopupMenuItemBuilder(VoidPtr L, int idx, String? name) {
  var callback = _getLuaCallback(L, idx, name);
  if (callback == null) {
    return null;
  }

  return (BuildContext context) {
    List<Object> items = callback.invoke<List<Object>>(L, [context]);
    return items.map((item) => item as PopupMenuEntry<int>).toList();
  };
}

DropdownButtonBuilder? _getDropdownButtonBuilder(VoidPtr L, int idx, String? name) {
  var callback = _getLuaCallback(L, idx, name);
  if (callback == null) {
    return null;
  }

  return (BuildContext context) {
    List<Object> items = callback.invoke<List<Object>>(L, [context]);
    return items.map((item) => item as Widget).toList();
  };
}

MaterialPropertyResolver<T>? _getMaterialPropertyResolverT<T>(VoidPtr L, int idx, String? name) {
  var callback = _getLuaCallback(L, idx, name);
  if (callback == null) {
    return null;
  }

  return (Set<MaterialState> states) {
    return callback.invoke<T>(L, [states]);
  };
}

NullableIndexedWidgetBuilder? _getNullableIndexedWidgetBuilder(VoidPtr L, int idx, String? name) {
  var callback = _getLuaCallback(L, idx, name);
  if (callback == null) {
    return null;
  }

  return (BuildContext context, int index) {
    return callback.invoke<Widget>(L, [context, index]);
  };
}

class MaterialStatePropertyT {
  static MaterialStateProperty<Color> resolveColor(MaterialPropertyResolver<Color> callback) {
    return MaterialStateProperty.resolveWith(callback);
  }

  static MaterialStateProperty<BorderSide> resolveBorderSide(MaterialPropertyResolver<BorderSide> callback) {
    return MaterialStateProperty.resolveWith(callback);
  }
}

int meta_gc(VoidPtr L) {
  int id = _luaToObject(L, 1);
  if (_idToObject.remove(id) != null || _idToObjectWeak.remove(id) != null)
  {
    return 0;
  }
  
  debugPrint("$id already released");
  return 0;
}

int meta_tostring(VoidPtr L) {
  var obj = luaToObject(L, 1);
  luaPushString(L, obj.toString());
  return 1;
}

int meta_eq(VoidPtr L) {
  var obj1 = luaToObject(L, 1);
  var obj2 = luaToObject(L, 2);
  //lua_pushboolean(L, identical(obj1, obj2));
  lua_pushboolean(L, obj1 == obj2);
  return 1;
}

//StateSetter __call
int _StateSetter_call(VoidPtr L) {
  try {
    assert(lua_type(L, 1) == LUA_TUSERDATA);
    StateSetter self = luaToObjectT<StateSetter>(L, 1)!;
    self((){});

    return 0;
  } catch (e, stacktrace) {
    luaL_error(L, '$e\n$stacktrace');
    return 0;
  }
}

const EdgeInsets _defaultInsetPadding = EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0); //dialog.dart
const double _kMenuDividerHeight = 16.0; //popup_menu.dart
const Duration _snackBarDisplayDuration = Duration(milliseconds: 4000); //snack_bar.dart

int debugPaintSize(VoidPtr L) {
  bool enabled = luaL_checkboolean(L, 1);
  debugPaintSizeEnabled = enabled;
  return 0;
}

int debugPaintBaselines(VoidPtr L) {
  bool enabled = luaL_checkboolean(L, 1);
  debugPaintBaselinesEnabled = enabled;
  return 0;
}

int debugPaintPointers(VoidPtr L) {
  bool enabled = luaL_checkboolean(L, 1);
  debugPaintPointersEnabled = enabled;
  return 0;
}

int debugPaintLayerBorders(VoidPtr L) {
  bool enabled = luaL_checkboolean(L, 1);
  debugPaintLayerBordersEnabled = enabled;
  return 0;
}

int debugRepaintRainbow(VoidPtr L) {
  bool enabled = luaL_checkboolean(L, 1);
  debugRepaintRainbowEnabled = enabled;
  return 0;
}

void _initDebugUtils() {
  int address = ffi.Pointer.fromFunction<lua_CFunction>(debugPaintSize, exceptionalReturn).address;
  luaRegisterFunction(g_L, 'debugPaintSize', address);

  address = ffi.Pointer.fromFunction<lua_CFunction>(debugPaintBaselines, exceptionalReturn).address;
  luaRegisterFunction(g_L, 'debugPaintBaselines', address);

  address = ffi.Pointer.fromFunction<lua_CFunction>(debugPaintPointers, exceptionalReturn).address;
  luaRegisterFunction(g_L, 'debugPaintPointers', address);

  address = ffi.Pointer.fromFunction<lua_CFunction>(debugPaintLayerBorders, exceptionalReturn).address;
  luaRegisterFunction(g_L, 'debugPaintLayerBorders', address);

  address = ffi.Pointer.fromFunction<lua_CFunction>(debugRepaintRainbow, exceptionalReturn).address;
  luaRegisterFunction(g_L, 'debugRepaintRainbow', address);

  address = ffi.Pointer.fromFunction<lua_CFunction>(getLuaCallbackCount, exceptionalReturn).address;
  luaRegisterFunction(g_L, 'getLuaCallbackCount', address);

  address = ffi.Pointer.fromFunction<lua_CFunction>(dumpLuaCallback, exceptionalReturn).address;
  luaRegisterFunction(g_L, 'dumpLuaCallback', address);
}

void _initLuaUtils() {
  g_L = luaGetGlobalState();
  debugPrint("LuaState ${g_L}");
  if (g_L.address == 0)
  {
    return;
  }

  int address;

  address = ffi.Pointer.fromFunction<lua_CFunction>(break_circular_reference, exceptionalReturn).address;
  setDartFunctionPtr('break_circular_reference', address);

  address = ffi.Pointer.fromFunction<lua_CFunction>(meta_gc, exceptionalReturn).address;
  luaRegisterFunction(g_L, 'dart_metal.__gc', address);

  address = ffi.Pointer.fromFunction<lua_CFunction>(meta_tostring, exceptionalReturn).address;
  luaRegisterFunction(g_L, 'dart_metal.__tostring', address);

  address = ffi.Pointer.fromFunction<lua_CFunction>(meta_eq, exceptionalReturn).address;
  luaRegisterFunction(g_L, 'dart_metal.__eq', address);

  //StateSetter
  luaRegisterClass(g_L, '(() => void) => void', '', 0, 0);
  address = ffi.Pointer.fromFunction<lua_CFunction>(_StateSetter_call, exceptionalReturn).address;
  luaRegisterMethod(g_L, '(() => void) => void', '__call', address);

  _autoBind(g_L);

  var callback = LuaCallback(null);
  _callbackFinalizer.attach(callback, LUA_REFNIL, detach:callback);
  //debugPrint("callback $callback");

  assert(
    () {
      int address;
      address = ffi.Pointer.fromFunction<lua_CFunction>(testLuaCallDart, exceptionalReturn).address;
      luaRegisterFunction(g_L, 'testLuaCallDart', address);

      dostring(g_L, "print('call from dart dostring', 123, true, false, 456.789)");
      luaCall<void>(g_L, "print", ['call from dart', false, 2357, "abcde", 123.456, true]);

      debugPrint("testLuaCallDart ${luaCall<int>(g_L, 'testLuaCallDart', [111, 222])}");

      _initDebugUtils();
      return true;
    }()
  );
}
