
part of flutter_unreal;

const int LUA_OK =	0;
const int LUA_YIELD	= 1;
const int LUA_ERRRUN = 2;
const int LUA_ERRSYNTAX = 3;
const int LUA_ERRMEM = 4;
const int LUA_ERRERR = 5;

const int LUA_TNONE =	-1;
const int LUA_TNIL = 0;
const int LUA_TBOOLEAN = 1;
const int LUA_TLIGHTUSERDATA = 2;
const int LUA_TNUMBER = 3;
const int LUA_TSTRING =	4;
const int LUA_TTABLE = 5;
const int LUA_TFUNCTION = 6;
const int LUA_TUSERDATA	=	7;
const int LUA_TTHREAD	=	8;

const int LUAI_MAXSTACK	=	1000000;
const int LUA_REGISTRYINDEX	= (-LUAI_MAXSTACK - 1000);

const int LUA_NOREF = (-2);
const int LUA_REFNIL = (-1);

const int LUA_MULTRET	= (-1);

@ffi.Native<ffi.Void Function(VoidPtr)>()
external void lua_pushnil(VoidPtr L); //void lua_pushnil (lua_State *L); [-0, +1, –]

@ffi.Native<Utf8Ptr Function(VoidPtr, ffi.Int32, Int64Ptr)>()
external Utf8Ptr lua_tolstring(VoidPtr L, int index, Int64Ptr len);  //const char *lua_tolstring (lua_State *L, int index, size_t *len); [-0, +0, m]

@ffi.Native<ffi.Int32 Function(VoidPtr, ffi.Int32)>()
external int lua_isnumber(VoidPtr L, int index);//int lua_isnumber (lua_State *L, int index); [-0, +0, –]

@ffi.Native<ffi.Int64 Function(VoidPtr, ffi.Int32, Int32Ptr)>()
external int lua_tointegerx(VoidPtr L, int index, Int32Ptr isnum); //lua_Integer lua_tointegerx (lua_State *L, int index, int *isnum); [-0, +0, –]

@ffi.Native<ffi.Double Function(VoidPtr, ffi.Int32, Int32Ptr)>()
external double lua_tonumberx(VoidPtr L, int index, Int32Ptr isnum); //lua_Number lua_tonumberx (lua_State *L, int index, int *isnum); [-0, +0, –]

@ffi.Native<ffi.Int32 Function(VoidPtr, ffi.Int32)>()
external int lua_toboolean(VoidPtr L, int index); //int lua_toboolean (lua_State *L, int index); [-0, +0, –]

@ffi.Native<Utf8Ptr Function(VoidPtr, ffi.Int32, ffi.Int32)>()
external Utf8Ptr tag_error_msg(VoidPtr L, int arg, int tag); //const char *tag_error_msg (lua_State *L, int arg, int tag); [-0, +n, m]

@ffi.Native<Utf8Ptr Function(VoidPtr, ffi.Int32, Utf8Ptr)>()
external Utf8Ptr arg_error_msg(VoidPtr L, int arg, Utf8Ptr extramsg); //const char *arg_error_msg (lua_State *L, int arg, const char* extramsg); [-0, +n, m]

@ffi.Native<ffi.Void Function(VoidPtr, Utf8Ptr)>(symbol: 'luaL_error_dart')
external void _luaL_error(VoidPtr L, Utf8Ptr error); //void luaL_error (lua_State *L, const char* error); [-0, +1, m]

@ffi.Native<ffi.Int32 Function(VoidPtr, ffi.Int32)>()
external int lua_setmetatable(VoidPtr L, int index); //int lua_setmetatable (lua_State *L, int index); [-1, +0, –]

@ffi.Native<ffi.Int32 Function(VoidPtr, ffi.Int32)>()
external int lua_getmetatable(VoidPtr L, int index); //int lua_getmetatable (lua_State *L, int index); [-0, +(0|1), –]

@ffi.Native<ffi.Int32 Function(VoidPtr, ffi.Int32, ffi.Int32, ffi.Int32)>(symbol: 'lua_pcall_dart')
external int lua_pcall(VoidPtr L, int nargs, int nresults, int errfunc); //int lua_pcall (lua_State *L, int nargs, int nresults, int msgh); [-(nargs + 1), +(nresults|1), –]

void lua_pop(VoidPtr L, int n)
{
  lua_settop(L, -n-1);
}

@ffi.Native<ffi.Void Function(VoidPtr, ffi.Int64)>()
external void lua_pushinteger(VoidPtr L, int v); //void lua_pushinteger (lua_State *L, lua_Integer n); [-0, +1, –]

@ffi.Native<ffi.Void Function(VoidPtr, ffi.Double)>()
external void lua_pushnumber(VoidPtr L, double v); //void lua_pushnumber (lua_State *L, lua_Number n); [-0, +1, –]

@ffi.Native<ffi.Void Function(VoidPtr, ffi.Int32)>(symbol: 'lua_pushboolean')
external void _lua_pushboolean(VoidPtr L, int v); //void lua_pushboolean (lua_State *L, int b); [-0, +1, –]
void lua_pushboolean(VoidPtr L, bool v) {
  _lua_pushboolean(L, v ? 1 : 0);
}

@ffi.Native<VoidPtr Function(VoidPtr, Utf8Ptr, ffi.Uint64)>()
external VoidPtr lua_pushlstring(VoidPtr L, Utf8Ptr str, int size); //const char *lua_pushlstring (lua_State *L, const char *s, size_t len); [-0, +1, m]

@ffi.Native<VoidPtr Function(VoidPtr, Utf8Ptr)>()
external VoidPtr lua_pushstring(VoidPtr L, Utf8Ptr str); //const char *lua_pushstring (lua_State *L, const char *s); [-0, +1, m]

@ffi.Native<ffi.Int32 Function(VoidPtr, ffi.Int32)>()
external int lua_type(VoidPtr L, int idx); //int lua_type (lua_State *L, int index); [-0, +0, –]

@ffi.Native<ffi.Void Function(VoidPtr, ffi.Int32)>()
external void lua_pushvalue(VoidPtr L, int idx); //void lua_pushvalue (lua_State *L, int index); [-0, +1, –]

@ffi.Native<ffi.Int32 Function(VoidPtr, ffi.Int32)>()
external int lua_next(VoidPtr L, int idx); //int lua_next (lua_State *L, int index); [-1, +(2|0), v]

@ffi.Native<ffi.Int32 Function(VoidPtr, ffi.Int32)>(symbol: 'lua_isinteger')
external int _lua_isinteger(VoidPtr L, int idx); //int lua_isinteger (lua_State *L, int index); [-0, +0, –]
bool lua_isinteger(VoidPtr L, int idx) {
  return _lua_isinteger(L, idx) != 0;
}

@ffi.Native<ffi.Int32 Function(VoidPtr)>()
external int lua_gettop(VoidPtr L); //int lua_gettop (lua_State *L); [-0, +0, –]

@ffi.Native<ffi.Void Function(VoidPtr, ffi.Int32)>()
external void lua_settop(VoidPtr L, int index); //void lua_settop (lua_State *L, int index); [-?, +?, e]

int lua_upvalueindex(int i)	{
  return LUA_REGISTRYINDEX - i;
}

@ffi.Native<ffi.Void Function(VoidPtr, ffi.Int32, ffi.Int32)>()
external void lua_createtable(VoidPtr L, int narr, int nrec); //void lua_createtable (lua_State *L, int narr, int nrec); [-0, +1, m]

@ffi.Native<ffi.Int32 Function(VoidPtr, ffi.Int32)>()
external int lua_rawget(VoidPtr L, int idx); //int lua_rawget (lua_State *L, int index); [-1, +1, –]

@ffi.Native<ffi.Int32 Function(VoidPtr, ffi.Int32, ffi.Int64)>()
external int lua_rawgeti(VoidPtr L, int idx, int n); //int lua_rawgeti (lua_State *L, int index, lua_Integer n); [-0, +1, –]

@ffi.Native<ffi.Void Function(VoidPtr, ffi.Int32)>()
external void lua_rawset(VoidPtr L, int idx); //void lua_rawset (lua_State *L, int index); [-2, +0, m]

@ffi.Native<ffi.Void Function(VoidPtr, ffi.Int32, ffi.Int64)>()
external void lua_rawseti(VoidPtr L, int idx, int n); //void lua_rawseti (lua_State *L, int index, lua_Integer i); [-1, +0, m]

@ffi.Native<ffi.Int32 Function(VoidPtr, ffi.Int32)>()
external int lua_gettable(VoidPtr L, int idx); //int lua_gettable (lua_State *L, int index); [-1, +1, e]

@ffi.Native<ffi.Int32 Function(VoidPtr, ffi.Int32, Utf8Ptr)>()
external int lua_getfield(VoidPtr L, int idx, Utf8Ptr k); //int lua_getfield (lua_State *L, int index, const char *k); [-0, +1, e]

@ffi.Native<ffi.Void Function(VoidPtr, ffi.Int32)>()
external void lua_settable(VoidPtr L, int idx); //void lua_settable (lua_State *L, int index); [-2, +0, e]

@ffi.Native<ffi.Void Function(VoidPtr, ffi.Int32, Utf8Ptr)>()
external void lua_setfield(VoidPtr L, int idx, Utf8Ptr k); //void lua_setfield (lua_State *L, int index, const char *k); [-1, +0, e]

@ffi.Native<ffi.Int32 Function(VoidPtr, Utf8Ptr)>()
external int lua_getglobal(VoidPtr L, Utf8Ptr name); //int lua_getglobal (lua_State *L, const char *name); [-0, +1, e]

@ffi.Native<ffi.Void Function(VoidPtr, Utf8Ptr)>()
external void lua_setglobal(VoidPtr L, Utf8Ptr name); //void lua_setglobal (lua_State *L, const char *name); [-1, +0, e]

@ffi.Native<ffi.Int64 Function(VoidPtr, ffi.Int32)>()
external int lua_rawlen(VoidPtr L, int idx); //lua_Unsigned lua_rawlen (lua_State *L, int index); [-0, +0, –]

@ffi.Native<ffi.Int32 Function(VoidPtr, ffi.Int32)>()
external int lua_absindex(VoidPtr L, int idx); //int lua_absindex (lua_State *L, int idx); [-0, +0, –]

@ffi.Native<ffi.Int32 Function(VoidPtr, ffi.Int32)>()
external int luaL_ref(VoidPtr L, int idx); //int luaL_ref (lua_State *L, int t); [-1, +0, m]

@ffi.Native<ffi.Void Function(VoidPtr, ffi.Int32, ffi.Int32)>()
external void luaL_unref(VoidPtr L, int idx, int ref); //void luaL_unref (lua_State *L, int t, int ref); [-0, +0, –]

@ffi.Native<Utf8Ptr Function(VoidPtr, ffi.Int32, ffi.Int32)>()
external Utf8Ptr lua_getupvalue(VoidPtr L, int funcindex, int n); //const char *lua_getupvalue (lua_State *L, int funcindex, int n); [-0, +(0|1), –]

@ffi.Native<Utf8Ptr Function(VoidPtr, ffi.Int32, ffi.Int32)>()
external Utf8Ptr lua_setupvalue(VoidPtr L, int funcindex, int n); //const char *lua_setupvalue (lua_State *L, int funcindex, int n); [-(0|1), +0, –]

@ffi.Native<ffi.Void Function(VoidPtr, VoidPtr, Utf8Ptr, ffi.Int32)>()
external void luaL_traceback(VoidPtr L, VoidPtr L1, Utf8Ptr msg, int level);  //void luaL_traceback (lua_State *L, lua_State *L1, const char *msg, int level); [-0, +1, m]

void tag_error (VoidPtr L, int arg, int tag) {
  int top = lua_gettop(L);
  String msg = tag_error_msg(L, arg, tag).toDartString();
  lua_settop(L, top);
  throw msg;
}

void arg_error (VoidPtr L, int arg, String extramsg) {
  int top = lua_gettop(L);
  
  Utf8Ptr utf8Str = extramsg.toNativeUtf8();
  String msg = arg_error_msg(L, arg, utf8Str).toDartString();
  malloc.free(utf8Str);
  
  lua_settop(L, top);
  throw msg;
}

Utf8Ptr luaL_checklstring (VoidPtr L, int arg, Int64Ptr len) {
  Utf8Ptr s = lua_tolstring(L, arg, len);
  if (s == ffi.nullptr) {
   tag_error(L, arg, LUA_TSTRING);
  }

  return s;
}

Utf8Ptr luaL_checkstring(VoidPtr L, int index) {
  return luaL_checklstring(L, index, ffi.nullptr);
}

Utf8Ptr lua_tostring(VoidPtr L, int index) {
  return lua_tolstring(L, index, ffi.nullptr);
}

void interror (VoidPtr L, int arg) {
  if (lua_isnumber(L, arg) != 0) {
    arg_error(L, arg, "number has no integer representation");
  }
  else {
    tag_error(L, arg, LUA_TNUMBER);
  }
}

int luaL_checkinteger(VoidPtr L, int index) {
  final Int32Ptr isnum  = malloc<ffi.Int32>(1);
  int d = lua_tointegerx(L, index, isnum);
  int isnum_value = isnum.value;
  malloc.free(isnum);

  if (isnum_value == 0) {
    interror(L, index);
  }

  return d;
}

int lua_tointeger(VoidPtr L, int index) {
  return lua_tointegerx(L, index, ffi.nullptr);
}

double luaL_checknumber(VoidPtr L, int index) {
  final Int32Ptr isnum  = malloc<ffi.Int32>(1);
  double d = lua_tonumberx(L, index, isnum);
  int isnum_value = isnum.value;
  malloc.free(isnum);

  if (isnum_value == 0) {
    tag_error(L, index, LUA_TNUMBER);
  }

  return d;
}

double lua_tonumber(VoidPtr L, int index) {
  return lua_tonumberx(L, index, ffi.nullptr);
}

void luaL_checktype (VoidPtr L, int arg, int t) {
  if (lua_type(L, arg) != t) {
    tag_error(L, arg, t);
  }
}

bool luaL_checkboolean(VoidPtr L, int index)
{
  int type = lua_type(L, index);
  if (type == LUA_TBOOLEAN)
  {
      return lua_toboolean(L, index) == 0 ? false : true;
  }

  if (type == LUA_TNIL)
  {
      return false;
  }

  arg_error(L, index, "invalid boolean value");
  return false;
}

void luaL_error(VoidPtr L, String error) {
  Utf8Ptr str = error.toNativeUtf8();
  _luaL_error(L, str);
  malloc.free(str);
}
