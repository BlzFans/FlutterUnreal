
#include "FlutterLua.h"
#include "ThirdParty/flutter_engine/flutter_embedder.h"
#include "FlutterEmbeder.h"
#include <string>

#if FLUTTERUNREAL_WITH_LUA

//key = "a.b.c"
//push the value to stack and return the type of the value
int luaGetValue(lua_State* L, const char* key)
{
    lua_rawgeti(L, LUA_REGISTRYINDEX, LUA_RIDX_GLOBALS);       //[table]

    const char* ptr1 = key;
    const char* ptr2 = key;

    while (true)                                               //[table]
    {
        if (*ptr2 == '.')
        {
            lua_pushlstring(L, ptr1, ptr2 - ptr1);             //[table name]
            lua_gettable(L, -2);                               //[table value]
            if (!lua_istable(L, -1) && !lua_isuserdata(L, -1))
            {
                lua_pop(L, 2);
                lua_pushnil(L);                                //[nil]
                return LUA_TNIL;
            }

            lua_remove(L, -2);                                 //[newtable]
            ptr2++;
            ptr1 = ptr2;
        }
        else if (*ptr2 == '\0')
        {
            lua_pushlstring(L, ptr1, ptr2 - ptr1);             //[table name]
            int type = lua_gettable(L, -2);                    //[table, value]
            lua_remove(L, -2);                                 //[value]
            return type;
        }
        else
        {
            ptr2++;
        }
    }
}
Cpp2Dart(luaGetValue);

//key = "a.b.c"
//[key] = value, value at the top of the stack
bool luaSetValue(lua_State* L, const char* key)
{
    //[value]
    lua_rawgeti(L, LUA_REGISTRYINDEX, LUA_RIDX_GLOBALS);   //[value table]

    const char* ptr1 = key;
    const char* ptr2 = key;

    while (true)                                           //[value table]
    {
        if (*ptr2 == '.')
        {
            //get table or create table
            lua_pushlstring(L, ptr1, ptr2 - ptr1);         //[value table name]
            lua_pushvalue(L, -1);                          //[value table name name]
            lua_rawget(L, -3);                             //[value table name value]
            if (lua_isnil(L, -1))
            {
                lua_pop(L, 1);                             //[value table name]
                lua_createtable(L, 0, 0);                  //[value table name newtable]
                lua_pushvalue(L, -2);                      //[value table name newtable name]
                lua_pushvalue(L, -2);                      //[value table name newtable name newtable]
                lua_rawset(L, -5);                         //[value table name newtable]
            }
            else if (!lua_istable(L, -1))
            {
                lua_pop(L, 4);
                return false;
            }

            lua_remove(L, -2);                             //[value table newtable]
            lua_remove(L, -2);                             //[value newtable]

            ptr2++;
            ptr1 = ptr2;
        }
        else if (*ptr2 == '\0')
        {
            lua_pushlstring(L, ptr1, ptr2 - ptr1);         //[value table name]
            lua_pushvalue(L, -3);                          //[value table name value]
            lua_rawset(L, -3);                             //[value table]
            lua_pop(L, 2);
            return true;
        }
        else
        {
            ptr2++;
        }
    }
}
Cpp2Dart(luaSetValue);

static void callstack(lua_State* L, int n)
{
    lua_Debug ar;
    if (lua_getstack(L, n, &ar) == 1)
    {
        lua_getinfo(L, "nSlu", &ar);
        if (ar.name)
        {
            printf("--->%s %d %s\n", ar.source, ar.currentline, ar.name);
        }
        else
        {
            printf("--->%s %d\n", ar.source, ar.currentline);
        }

        callstack(L, n + 1);
    }
}

int onError(lua_State* L)
{
    printf("--->\n");
    printf("---> %s\n", lua_tostring(L, -1));
    printf("--->\n");
    callstack(L, 0);
    printf("--->\n");

    return 1;
}

lua_State* g_L = nullptr;

static int lua_pcall_dart(lua_State* L, int nargs, int nresults, int errfunc)
{
    if (errfunc != 0)
    {
        lua_pushcclosure(L, onError, 0);
        lua_replace(L, errfunc);
    }
    return lua_pcall(L, nargs, nresults, errfunc);
}
Cpp2Dart(lua_pcall_dart);

static int dartGetProp(lua_State* L)
{
    int64_t(*dartFunction)(void*);
    dartFunction = (decltype(dartFunction))lua_touserdata(L, lua_upvalueindex(2));
    if (dartFunction != nullptr)
    {
        DartStateScope scope;
        return (int)dartFunction(L);
    }

    lua_pushnil(L);
    return 1;
}

static int meta_index(lua_State* L)                //[userdata key]
{
    if (lua_type(L, 2) != LUA_TSTRING)
        return 0;

    lua_pushvalue(L, 2);                           //[userdata key key]
    int type = lua_rawget(L, lua_upvalueindex(1)); //[userdata key value] upvalue1: metatable
    if (type != LUA_TNIL) {
        return 1;
    }

    lua_pop(L, 1);                                //[userdata key]
    int nresult = dartGetProp(L);                 //[userdata key value]
    check(nresult == 1);
    type = lua_type(L, 3);
    if (type != LUA_TNIL)
        return nresult;

    lua_pop(L, nresult);                          //[userdata key]

    //call super class meta_index

    lua_pushvalue(L, lua_upvalueindex(3));        //[userdata key super__meta__index]
    type = lua_type(L, 3);
    if (type == LUA_TFUNCTION) {
        lua_pushvalue(L, -3);                     //[userdata key super__meta__index userdata]
        lua_pushvalue(L, -3);                     //[userdata key super__meta__index userdata key]
        if (LUA_OK == lua_pcall(L, 2, 1, 0))      //[userdata key value]
        {
        }
        else
        {
            //const char* errMsg = lua_tostring(L, -1);   //[userdata key errMsg]
            lua_pop(L, 1);                                //[userdata key]
            lua_pushnil(L);                               //[userdata key nil]
        }

        return 1;
    }

    lua_pop(L, 1);
    lua_pushnil(L);                               //[userdata key nil]
    return 1;
}

static int dartSetProp(lua_State* L)
{
    int64_t(*dartFunction)(void*);
    dartFunction = (decltype(dartFunction))lua_touserdata(L, lua_upvalueindex(2));
    if (dartFunction != nullptr)
    {
        DartStateScope scope;
        return (int)dartFunction(L);
    }

    lua_pushboolean(L, 0);
    return 1;
}

bool luaL_checkboolean(lua_State* L, int idx)
{
    if (lua_isboolean(L, idx))
    {
        return lua_toboolean(L, idx) ? true : false;
    }

    if (lua_isnil(L, idx))
    {
        return false;
    }

    luaL_argerror(L, idx, "invalid boolean value");
    return false;
}

static int meta_newindex(lua_State* L)            //[userdata key value]
{
    if (lua_type(L, 2) != LUA_TSTRING)
        return 0;

    int nresult = dartSetProp(L);                 //[userdata key value result]
    check(nresult == 1);
    bool result = luaL_checkboolean(L, 4);
    if (result)
        return nresult;

    lua_pop(L, nresult);                          //[userdata key value]

    //call super class meta_index
    lua_pushvalue(L, lua_upvalueindex(3));        //[userdata key value super__meta__newindex]
    int type = lua_type(L, 4);
    if (type == LUA_TFUNCTION) {
        lua_pushvalue(L, -4);                     //[userdata key value super__meta__newindex userdata]
        lua_pushvalue(L, -4);                     //[userdata key value super__meta__newindex userdata key]
        lua_pushvalue(L, -4);                     //[userdata key value super__meta__newindex userdata key value]
        if (LUA_OK == lua_pcall(L, 3, 1, 0))      //[userdata key value result]
        {
        }
        else
        {
            //const char* errMsg = lua_tostring(L, -1);   //[userdata key value errMsg]
            lua_pop(L, 1);                                //[userdata key value]
            lua_pushboolean(L, 0);                        //[userdata key value false]
        }

        return 1;
    }

    lua_pop(L, 1);                                //[userdata key value]
    lua_pushboolean(L, 0);                        //[userdata key value false]
    return 1;
}

static void luaRegisterClass(lua_State* L, const char* className, const char* superClass, int64_t getProp, int64_t setProp)
{
    int type = luaGetValue(L, className);
    lua_pop(L, 1);
    check(type == LUA_TNIL);

    lua_createtable(L, 0, 3);                      //[table]
    lua_pushvalue(L, -1);                          //[table table]
    lua_setmetatable(L, -2);                       //[table]

    //__index
    lua_pushstring(L, "__index");                  //[table "__index"]
    lua_pushvalue(L, -2);                          //[table "__index" table]
    lua_pushlightuserdata(L, (void*)getProp);      //[table "__index" table getProp]
    if (superClass && superClass[0]) {
        type = luaGetValue(L, superClass);         //[table "__index" table getProp superClass]
        check(type == LUA_TTABLE || type == LUA_TNIL);

        if (type == LUA_TTABLE) {
            lua_pushstring(L, "__index");                 //[table "__index" table getProp superClass "__index"]
            type = lua_rawget(L, -2);                     //[table "__index" table getProp superClass super__index]
            check(type == LUA_TFUNCTION);
            lua_remove(L, -2);                            //[table "__index" table getProp super__index]
        }
    }
    else {
        lua_pushnil(L);                            //[table "__index" table getProp nil]
    }
    lua_pushcclosure(L, meta_index, 3);            //[table "__index" meta_index]
    lua_rawset(L, -3);                             //[table]

    //__newindex
    lua_pushstring(L, "__newindex");                  //[table "__newindex"]
    lua_pushvalue(L, -2);                             //[table "__newindex" table]
    lua_pushlightuserdata(L, (void*)setProp);         //[table "__newindex" table setProp]
    if (superClass && superClass[0]) {
        type = luaGetValue(L, superClass);            //[table "__newindex" table setProp superClass]
        check(type == LUA_TTABLE || type == LUA_TNIL);

        if (type == LUA_TTABLE) {
            lua_pushstring(L, "__newindex");                 //[table "__newindex" table setProp superClass "__newindex"]
            type = lua_rawget(L, -2);                        //[table "__newindex" table setProp superClass super__newindex]
            check(type == LUA_TFUNCTION);
            lua_remove(L, -2);                               //[table "__newindex" table setProp super__newindex]
        }
    }
    else {
        lua_pushnil(L);                            //[table "__newindex" table setProp nil]
    }
    lua_pushcclosure(L, meta_newindex, 3);         //[table "__newindex" meta_newindex]
    lua_rawset(L, -3);                             //[table]

    //__gc
    lua_pushstring(L, "__gc");                     //[table "__gc"]
    luaGetValue(L, "dart_metal.__gc");             //[table "__gc" dart_metal.__gc]
    lua_rawset(L, -3);                             //[table]

    //__tostring
    lua_pushstring(L, "__tostring");               //[table "__tostring"]
    luaGetValue(L, "dart_metal.__tostring");       //[table "__tostring" dart_metal.__tostring]
    lua_rawset(L, -3);                             //[table]

    //__eq
    lua_pushstring(L, "__eq");                     //[table "__eq"]
    luaGetValue(L, "dart_metal.__eq");             //[table "__eq" dart_metal.__eq]
    lua_rawset(L, -3);                             //[table]

    //name
    lua_pushstring(L, "name");                     //[table "name"]
    lua_pushstring(L, className);                  //[table "name" className]
    lua_rawset(L, -3);                             //[table]

    //__super
    if (superClass && superClass[0]) {
        lua_pushstring(L, "__super");              //[table "__super"]
        type = luaGetValue(L, superClass);         //[table "__super" superClass]
        check(type == LUA_TTABLE);

        lua_rawset(L, -3);                         //[table]
    }

    luaSetValue(L, className);                    //[]
}
Cpp2Dart(luaRegisterClass);

static int dart_method_call(lua_State* L)
{
    int64_t(*dartFunction)(void*);
    dartFunction = (decltype(dartFunction))lua_touserdata(L, lua_upvalueindex(1));
    check(dartFunction != nullptr);

    int ret = 0;
    {
        DartStateScope scope;
        ret = (int)dartFunction(L);
    }

    if (lua_toboolean(L, lua_upvalueindex(2)))
    {
        lua_pushboolean(L, 0);
        lua_replace(L, lua_upvalueindex(2));
        return lua_error(L);
    }

    return ret;
}

static void luaL_error_dart(lua_State* L, const char* error)
{
    lua_pushboolean(L, 1);
    lua_replace(L, lua_upvalueindex(2));
    lua_pushstring(L, error);
}
Cpp2Dart(luaL_error_dart);

static void luaRegisterMethod(lua_State* L, const char* className, const char* method, int64_t address)
{
    check(className);
    int type = luaGetValue(L, className);
    check(type == LUA_TTABLE);
    if (type != LUA_TTABLE)
    {
        lua_pop(L, 1);
        return;
    }

    lua_pushstring(L, method);
    lua_pushlightuserdata(L, (void*)address);
    lua_pushboolean(L, 0);                              //lua_error
    lua_pushcclosure(L, dart_method_call, 2);
    lua_rawset(L, -3);

    lua_pop(L, 1);
}
Cpp2Dart(luaRegisterMethod);

static void luaRegisterFunction(lua_State* L, const char* function, int64_t address)
{
    lua_pushlightuserdata(L, (void*)address);
    lua_pushboolean(L, 0);                              //lua_error
    lua_pushcclosure(L, dart_method_call, 2);
    luaSetValue(L, function);
}
Cpp2Dart(luaRegisterFunction);

static void luaPushObject(lua_State* L, int64_t id, int metaTable)
{
    void* userData = lua_newuserdata(L, sizeof(int64_t));
    *(int64_t*)userData = id;

    int type = lua_rawgeti(L, LUA_REGISTRYINDEX, metaTable);
    check(type == LUA_TTABLE);
    lua_setmetatable(L, -2);
}
Cpp2Dart(luaPushObject)

static int64_t luaToObject(lua_State* L, int32_t idx)
{
    void* userData = lua_touserdata(L, idx);
    if (userData) {
        return *(int64_t*)userData;
    }

    return 0;
}
Cpp2Dart(luaToObject)

Cpp2Dart(lua_pushnil);
Cpp2Dart(lua_setmetatable);
Cpp2Dart(lua_getmetatable);
Cpp2Dart(lua_touserdata);

Cpp2Dart(lua_tolstring);
Cpp2Dart(lua_pushinteger);
Cpp2Dart(lua_pushnumber);
Cpp2Dart(lua_pushboolean);

Cpp2Dart(lua_pushlstring);
Cpp2Dart(lua_pushstring);

Cpp2Dart(lua_type);
Cpp2Dart(lua_pushvalue);
Cpp2Dart(lua_next);
Cpp2Dart(lua_gettop);
Cpp2Dart(lua_settop);
Cpp2Dart(lua_createtable);
Cpp2Dart(lua_rawget);
Cpp2Dart(lua_rawgeti);
Cpp2Dart(lua_rawset);
Cpp2Dart(lua_rawseti);

Cpp2Dart(lua_gettable);
Cpp2Dart(lua_getfield);

Cpp2Dart(lua_settable);
Cpp2Dart(lua_setfield);

Cpp2Dart(lua_setglobal);
Cpp2Dart(lua_getglobal);

Cpp2Dart(lua_rawlen);

Cpp2Dart(lua_absindex);

Cpp2Dart(luaL_ref);
Cpp2Dart(luaL_unref);

Cpp2Dart(lua_getupvalue);
Cpp2Dart(lua_setupvalue);

Cpp2Dart(lua_isnumber);
Cpp2Dart(lua_tointegerx);
Cpp2Dart(lua_tonumberx);
Cpp2Dart(lua_toboolean);
Cpp2Dart(luaL_traceback);

/*
** Search for 'objidx' in table at index -1. ('objidx' must be an
** absolute index.) Return 1 + string at top if it found a good name.
*/
static int findfield(lua_State* L, int objidx, int level) {
    if (level == 0 || !lua_istable(L, -1))
        return 0;  /* not found */
    lua_pushnil(L);  /* start 'next' loop */
    while (lua_next(L, -2)) {  /* for each pair in table */
        if (lua_type(L, -2) == LUA_TSTRING) {  /* ignore non-string keys */
            if (lua_rawequal(L, objidx, -1)) {  /* found object? */
                lua_pop(L, 1);  /* remove value (but keep name) */
                return 1;
            }
            else if (findfield(L, objidx, level - 1)) {  /* try recursively */
                /* stack: lib_name, lib_table, field_name (top) */
                lua_pushliteral(L, ".");  /* place '.' between the two names */
                lua_replace(L, -3);  /* (in the slot occupied by table) */
                lua_concat(L, 3);  /* lib_name.field_name */
                return 1;
            }
        }
        lua_pop(L, 1);  /* remove value */
    }
    return 0;  /* not found */
}

/*
** Search for a name for a function in all loaded modules
*/
static int pushglobalfuncname(lua_State* L, lua_Debug* ar) {
    int top = lua_gettop(L);
    lua_getinfo(L, "f", ar);  /* push function */
    lua_getfield(L, LUA_REGISTRYINDEX, LUA_LOADED_TABLE);
    if (findfield(L, top + 1, 2)) {
        const char* name = lua_tostring(L, -1);
        if (strncmp(name, LUA_GNAME ".", 3) == 0) {  /* name start with '_G.'? */
            lua_pushstring(L, name + 3);  /* push name without prefix */
            lua_remove(L, -2);  /* remove original name */
        }
        lua_copy(L, -1, top + 1);  /* copy name to proper place */
        lua_settop(L, top + 1);  /* remove table "loaded" and name copy */
        return 1;
    }
    else {
        lua_settop(L, top);  /* remove function and global table */
        return 0;
    }
}

static const char* tag_error_msg(lua_State* L, int arg, int tag)
{
    //tag_error
    const char* tname = lua_typename(L, tag);

    //luaL_typeerror
    const char* extramsg;
    const char* typearg;  /* name for the type of the actual argument */
    if (luaL_getmetafield(L, arg, "__name") == LUA_TSTRING)
        typearg = lua_tostring(L, -1);  /* use the given type name */
    else if (lua_type(L, arg) == LUA_TLIGHTUSERDATA)
        typearg = "light userdata";  /* special name for messages */
    else
        typearg = luaL_typename(L, arg);  /* standard name */
    extramsg = lua_pushfstring(L, "%s expected, got %s", tname, typearg);

    //luaL_argerror
    lua_Debug ar;
    if (!lua_getstack(L, 0, &ar))  /* no stack frame? */
        return lua_pushfstring(L, "bad argument #%d (%s)", arg, extramsg);
    lua_getinfo(L, "n", &ar);
    if (strcmp(ar.namewhat, "method") == 0) {
        arg--;  /* do not count 'self' */
        if (arg == 0)  /* error is in the self argument itself? */
            return lua_pushfstring(L, "calling '%s' on bad self (%s)",
                ar.name, extramsg);
    }
    if (ar.name == NULL)
        ar.name = (pushglobalfuncname(L, &ar)) ? lua_tostring(L, -1) : "?";
    return lua_pushfstring(L, "bad argument #%d to '%s' (%s)",
        arg, ar.name, extramsg);
}

Cpp2Dart(tag_error_msg);

static const char* arg_error_msg(lua_State* L, int arg, const char* extramsg)
{
    //luaL_argerror
    lua_Debug ar;
    if (!lua_getstack(L, 0, &ar))  /* no stack frame? */
        return lua_pushfstring(L, "bad argument #%d (%s)", arg, extramsg);
    lua_getinfo(L, "n", &ar);
    if (strcmp(ar.namewhat, "method") == 0) {
        arg--;  /* do not count 'self' */
        if (arg == 0)  /* error is in the self argument itself? */
            return lua_pushfstring(L, "calling '%s' on bad self (%s)",
                ar.name, extramsg);
    }
    if (ar.name == NULL)
        ar.name = (pushglobalfuncname(L, &ar)) ? lua_tostring(L, -1) : "?";
    return lua_pushfstring(L, "bad argument #%d to '%s' (%s)",
        arg, ar.name, extramsg);
}

Cpp2Dart(arg_error_msg);

bool _doBuffer(lua_State* L, const char* buffer, size_t size)
{
    int err = luaL_loadbuffer(L, buffer, size, "");
    if (err)
    {
        const char* str = lua_tostring(L, -1);
        printf("doBuffer luaL_loadbuffer %s\n", str);
        lua_pop(L, 1);
        return false;
    }

    if (lua_isfunction(L, -1))
    {
        err = lua_pcall(L, 0, LUA_MULTRET, 0);
        if (err)
        {
            const char* str = lua_tostring(L, -1);
            printf("doBuffer lua_pcall %s\n", str);
            lua_pop(L, 1);
        }
    }

    return err == LUA_OK ? true : false;
}

static void l_message(const char* pname, const char* msg) {
    if (pname) lua_writestringerror("%s: ", pname);
    lua_writestringerror("%s\n", msg);
}


/*
** Check whether 'status' is not OK and, if so, prints the error
** message on the top of the stack. It assumes that the error object
** is a string, as it was either generated by Lua or by 'msghandler'.
*/
static int report(lua_State* L, int status) {
    if (status != LUA_OK) {
        const char* msg = lua_tostring(L, -1);
        l_message("lua", msg);
        lua_pop(L, 1);  /* remove message */
    }
    return status;
}

static int msghandler(lua_State* L) {
    const char* msg = lua_tostring(L, 1);
    if (msg == NULL) {  /* is error object not a string? */
        if (luaL_callmeta(L, 1, "__tostring") &&  /* does it have a metamethod */
            lua_type(L, -1) == LUA_TSTRING)  /* that produces a string? */
            return 1;  /* that is the message */
        else
            msg = lua_pushfstring(L, "(error object is a %s value)",
                luaL_typename(L, 1));
    }
    luaL_traceback(L, L, msg, 1);  /* append a standard traceback */
    return 1;  /* return the traceback */
}

static int docall(lua_State* L, int narg, int nres) {
    int status;
    int base = lua_gettop(L) - narg;  /* function index */
    lua_pushcfunction(L, msghandler);  /* push message handler */
    lua_insert(L, base);  /* put it under function and args */
    status = lua_pcall(L, narg, nres, base);
    lua_remove(L, base);  /* remove message handler from the stack */
    return status;
}

static int dochunk(lua_State* L, int status) {
    if (status == LUA_OK) status = docall(L, 0, 0);
    return report(L, status);
}

int dofile(lua_State* L, const char* name) {
    return dochunk(L, luaL_loadfile(L, name));
}

int dostring(lua_State* L, const char* s) {
    return dochunk(L, luaL_loadbuffer(L, s, strlen(s), ""));
}

Cpp2Dart(dofile)
Cpp2Dart(dostring)

std::string s_line;
extern "C" void lua_printline()
{
    GLog->Log(s_line.c_str());
    s_line.clear();
}

extern "C" void lua_print(const char* s, size_t l)
{
    s_line.append(s, l);
}

static int panic(lua_State* L)
{
    FString msg = UTF8_TO_TCHAR(lua_tostring(L, -1));
    UE_LOG(LogTemp, Warning, TEXT("PANIC: unprotected error in call to Lua API (%s)"), *msg);
    return 0;
}

void initLua()
{
    g_L = luaL_newstate();
    lua_atpanic(g_L, panic);
    luaL_openlibs(g_L);
    lua_checkstack(g_L, 300);

    LuaConstructor* walk = LuaConstructor::first;
    for (; walk; walk = walk->next)
    {
        lua_pushcclosure(g_L, walk->function, 0);
        luaSetValue(g_L, walk->funcName);
    }
}

void closeLua()
{
    lua_close(g_L);
    g_L = nullptr;
}

LuaConstructor* LuaConstructor::first = NULL;
LuaConstructor::LuaConstructor(const char* funcName, lua_CFunction func)
    :funcName(funcName)
    ,function(func)
{
    next = first;
    first = this;
}

#endif //FLUTTERUNREAL_WITH_LUA

static void* luaGetGlobalState()
{
#if FLUTTERUNREAL_WITH_LUA
    return g_L;
#else
    return nullptr;
#endif
}
Cpp2Dart(luaGetGlobalState);
