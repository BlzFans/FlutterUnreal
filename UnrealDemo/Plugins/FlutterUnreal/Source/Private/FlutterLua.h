#pragma once

#include "ThirdParty/lua/lua.hpp"
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

