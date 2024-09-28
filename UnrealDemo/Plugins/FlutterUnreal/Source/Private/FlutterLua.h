#pragma once

#if FLUTTERUNREAL_WITH_LUA


#if FLUTTERUNREAL_WITH_LUA == FLUTTERUNREAL_LUA
//#include "ThirdParty/lua/lua.hpp"
extern "C"
{
#include "ThirdParty/minilua/minilua.h"
}

#elif FLUTTERUNREAL_WITH_LUA == FLUTTERUNREAL_UNLUA

#include "UnLua.h"

#elif FLUTTERUNREAL_WITH_LUA == FLUTTERUNREAL_SLUA

#include "slua.h"
using namespace NS_SLUA;

#endif

#ifndef LUA_GNAME
#define LUA_GNAME "_G"
#endif

extern lua_State* g_L;
void initLua();
void closeLua();

struct LuaConstructor
{
    const char* funcName;
    lua_CFunction function;

    ///
    LuaConstructor* next;
    static LuaConstructor* first;

    LuaConstructor(const char* funcName, lua_CFunction func);
};

#define LuaFunction(name)                                                                      \
static int lua_##name##_(lua_State *L);                                                        \
static LuaConstructor lua_##name##_obj(#name,  lua_##name##_);                                 \
int lua_##name##_(lua_State *L)

#endif //FLUTTERUNREAL_WITH_LUA
