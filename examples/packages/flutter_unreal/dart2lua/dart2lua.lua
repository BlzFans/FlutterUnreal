
function string:rtrim()
  return self:match'^(.*%S)%s*$'
end

function string:ltrim()
  return self:match'^%s*(.*)'
end

function string:trim()
    return self:rtrim():ltrim()
end

function string:contains(sub)
    return self:find(sub, 1, true) ~= nil
end

function string:startsWith(start)
    return self:sub(1, #start) == start
end

function string:endsWith(ending)
    return ending == "" or self:sub(-#ending) == ending
end

--[[
"hello world!":split()
-- this returns a table {'hello', 'world!'}
"foo,bar,bee,bear":split(',')
-- this returns {'foo','bar','bee','bear'}
]]
function string:split(sep)
    sep = sep or "%s"
    local t={}
    for str in self:gmatch("([^"..sep.."]+)") do
        table.insert(t, str)
    end
    return t
end

function string:count(pattern)
    return select(2, self:gsub(pattern, ""))
end

function string:splitParam()
    local t={}
    local lastParam = ""
    for str in self:gmatch("([^,]+)") do
        if #lastParam == 0 then
            lastParam = str
        else
            lastParam = lastParam .. "," .. str --"Map<K" .. "," .. "V>"
        end

        if lastParam:count("<") == lastParam:count(">") and lastParam:count("%(") == lastParam:count("%)") then --template and function param
            table.insert(t, lastParam)
            lastParam = ""
        end
    end
    return t
end

classes = {};
function class(className)
    assert(not classes[className])
    
    classes[className] = {name = className, super = "", alias = {}, methods = {}, vars = {}}
    classes[#classes + 1] = classes[className]
    return parseClass(classes[className])
end

function parseClass(cls)
    return function (classDef)
        for k, v in ipairs(classDef) do
            local type, read, write
            local i, j = v:find("→")
            if not i then
                i, j = v:find("↔")
                if i and j then
                    write = true
                    read = true
                end
            elseif i and j then
                read = true
                write = false
            end

            if i and j then
                type = v:sub(j + 1):trim()
                v = v:sub(1, i - 1):trim()
            end
            
            if v:endsWith(")") then
                local method = parseMethod(cls.name, type, v)
                table.insert(cls.methods, method)
            else
                parseVariable(cls, type, v, read, write)
            end
        end
        
        cls.super = classDef.super or ""
        cls.alias = classDef.alias or {}
        --return parseClass(cls)
    end
end

function removeKeyWord(str, keyword)
    local i, j = str:find(keyword .. ' ')
    if i == 1 then
        return str:sub(j + 1):trim(), true
    end
    
    if i then
        i, j = str:find(' ' .. keyword .. ' ')
        if i then
            return (str:sub(1, i) .. str:sub(j)):trim(), true
        end
    end
    
    return str, false
end

function parseMethod(clsName, returnType, methodDef)
    local i, j
    
    local method = {}
    
    i = methodDef:find('%(')
    assert(i)
    local name = methodDef:sub(1, i - 1):trim()
    
    --extract params (...)
    methodDef = methodDef:sub(i + 1)
    if methodDef == ")" then --method without params 
        methodDef = ""
    else
        methodDef = methodDef:sub(1, -2)
        methodDef = methodDef:trim()
    end

    local params = methodDef:splitParam()

    --static
    local isStatic
    name, isStatic = removeKeyWord(name, 'static')
    
    name = removeKeyWord(name, 'const')
    name = removeKeyWord(name, 'factory')
    
    local nullable = false
    --constructor
    if clsName and name == clsName then
        assert(returnType == nil)
        returnType = clsName
        method.isConstructor = true
        method.isDefaultConstructor = true
    elseif clsName and name:startsWith(clsName .. ".") then
        assert(returnType == nil)
        returnType = clsName
        name = name:sub(#clsName + 2)
        method.isConstructor = true
    elseif not returnType then
        i = name:find(' ')
        assert(i)
        
        returnType = name:sub(1, i):trim()
        if returnType:endsWith("?") then
            returnType = returnType:sub(1, -2):trim()
            nullable = true
         end

        name = name:sub(i + 1):trim()
    end

    method.name = name
    method.returnType = returnType
    method.nullable = nullable
    method.params = {}
    method.isStatic = isStatic

    local isNamed = false
    for k, v in ipairs(params) do 
        v = v:trim()
        
        --isNamed
        if not isNamed and v:startsWith("{") then
            isNamed = true
            v = v:sub(2)
        end
        if isNamed and k == #params then
            assert(v:endsWith("}"))
            v = v:sub(1, -2)
        end
        local param = parseParam(v, isNamed)
        table.insert(method.params, param)
    end
    
    return method
end

function parseParam(str, isNamed)
    local i, j
    str = str:trim()

    local defaultValue
    i = str:find("=")
    if i then
        defaultValue = str:sub(i + 1):trim()
        str = str:sub(1, i - 1):trim()
    end

    local isRequired
    str, isRequired = removeKeyWord(str, "required")

    local paramType, paramName = str:match'(.*) (.*)'
    paramType = paramType:trim()
    paramName = paramName:trim()

    local nullable
    if paramType:endsWith("?") then
       paramType = paramType:sub(1, -2):trim()
       nullable = true
    end

    local isList
    if paramType:startsWith("List") then
        local type = paramType:match'List<(.*)>'
        if type then
            isList = true
            paramType = type:trim()
        end
    end

    local isSet
    if paramType:startsWith("Set") then
        local type = paramType:match'Set<(.*)>'
        if type then
            isSet = true
            paramType = type:trim()
        end
    end

    local isMap
    if paramType:startsWith("Map") then
        local type = paramType:match'Map<(.*)>'
        if type then
            isMap = true
            paramType = type:trim()
        end
    end
    
    return {
        paramType = paramType, 
        paramName = paramName, 
        nullable = nullable, 
        defaultValue = defaultValue, 
        isNamed = isNamed,
        isList = isList,
        isSet = isSet,
        isMap = isMap,
    }
end

function parseVariable(cls, type, str, read, write)
    local i, j
    
    local var = {}
    
    local name = str:trim()
    
    --static
    local isStatic
    name, isStatic = removeKeyWord(name, 'static')
    
    local isConst
    name, isConst = removeKeyWord(name, 'const')

    local isFinal
    name, isFinal = removeKeyWord(name, 'final')
    
    local isGet
    name, isGet = removeKeyWord(name, 'get')
    
    local isSet
    name, isSet = removeKeyWord(name, 'set')

    local canRead = true
    if isSet then
        canRead = false
    end

    local canWrite = true
    if isGet or isConst or isFinal or write == false then
        canWrite = false
    end

    if not type then
        i = name:find(' ')
        assert(i)
        
        type = name:sub(1, i):trim()
        name = name:sub(i + 1):trim()
    end
    
    local nullable
    if type:endsWith("?") then
        type = type:sub(1, -2):trim()
        nullable = true
    end

    var.name = name
    var.type = type
    var.nullable = nullable
    var.isStatic = isStatic
    var.canRead = canRead
    var.canWrite = canWrite
    
    table.insert(cls.vars, var)
end

function parseEnum(name)
    return function (values)
        enums[name].values = values
    end
end

enums = {}
function enum(name)
    assert(not enums[name])
    assert(not classes[name])

    enums[name] = {name = name}
    enums[#enums + 1] = enums[name]
    return parseEnum(name)
end

functions = {}
function fn(funcDef)
    local method = parseMethod(nil, nil, funcDef)
    assert(not functions[method.name])
    functions[method.name] = method
    functions[#functions + 1] = method
end

local StringBuilder = require "StringBuilder"
local funcBuf = StringBuilder()
local bindBuf = StringBuilder()

function beginGenLua()
    funcBuf:clear()
    funcBuf:writeln()
    funcBuf:writeln("// ignore_for_file: invalid_use_of_protected_member")
    funcBuf:writeln("// ignore_for_file: sort_child_properties_last")
    funcBuf:writeln()
    funcBuf:writeln("part of flutter_unreal;")

    bindBuf:clear()
    bindBuf:writeln()
    bindBuf:writeln()
    bindBuf:writeln()
    bindBuf:writeln("void _autoBind(VoidPtr L) {")
    bindBuf:writeln("  int address = 0;")
    bindBuf:writeln("  int addressGet = 0;")
    bindBuf:writeln("  int addressSet = 0;")
end

function endGenLua()
    bindBuf:writeln()
    bindBuf:writeln("}")

    local f = assert(io.open("../lib/lua_auto_bind.dart", "w"))
    f:write(funcBuf:str())
    f:write(bindBuf:str())
    f:close()
end

function getCallbackFunction(paramType)
    if callbackFunctions[paramType] then
        return callbackFunctions[paramType][1]
    end
end

function defineParam(p, arg)
    funcBuf:writeln()
  
    local name = p.paramName
    
    local functionName = getCallbackFunction(p.paramType)

    local nullable = p.defaultValue or p.nullable

    --function param
    if functionName then
        if p.isNamed then
            funcBuf:write("    %s? %s = %s(L, top_, '%s')", p.paramType, name, functionName, name)
        else
            funcBuf:write("    %s? %s = %s(L, %d, null)", p.paramType, name, functionName, arg)
        end

        if nullable then
            funcBuf:writeln(";")
        else
            funcBuf:writeln("!;")
        end

        if p.defaultValue then
            funcBuf:writeln("    %s ??= %s;", name, p.defaultValue)
        end
        return
    end

    local type = p.paramType
  
    if p.isList then
        funcBuf:write("    List<%s>? %s = _get", p.paramType, name)
    elseif p.isSet then
        funcBuf:write("    Set<%s>? %s = _get", p.paramType, name)
    elseif p.isMap then
        funcBuf:write("    Map<%s>? %s = _get", p.paramType, name)
    else
        funcBuf:write("    %s? %s = _get", p.paramType, name)
    end

    if p.isNamed then
        funcBuf:write("Named")
    end

    if p.isList then
        funcBuf:write("List")
    elseif p.isSet then
        funcBuf:write("Set")
    elseif p.isMap then
        funcBuf:write("Map")
    end

    if p.isNamed then
        funcBuf:write("Param<%s>(L, top_, '%s')", p.paramType, name)
    else
        funcBuf:write("Param<%s>(L, %d)", p.paramType, arg)
    end

    if nullable then
        funcBuf:writeln(";")
    else
        funcBuf:writeln("!;")
    end

    if p.defaultValue then
        funcBuf:writeln("    %s ??= %s;", name, p.defaultValue)
    end
end

local function genMothod(cls, method)
    local className = cls.name
    local methodName = method.name
    local argIdx = 1

    local functionName = string.format("_%s_%s", className, methodName)
    functionName = string.gsub(functionName, "<", "$")
    functionName = string.gsub(functionName, ">", "$")
    
    local returnVoid = (method.returnType == "void")
  
    funcBuf:writeln("int %s(VoidPtr L) {", functionName)
    funcBuf:writeln("  try {")

    if method.isDefaultConstructor then
        funcBuf:writeln()
        funcBuf:writeln("    assert(lua_type(L, 1) == LUA_TTABLE);") --metatable
        argIdx = 2
    elseif method.isConstructor or method.isStatic then
        argIdx = 1
    else
        funcBuf:writeln()
        funcBuf:writeln("    %s self = luaToObjectT<%s>(L, 1)!;", className, className) --this object
        argIdx = 2
    end
    
    funcBuf:writeln()
    funcBuf:writeln("    int top_ = lua_gettop(L); assert(top_ >= 0);")
    
    local params = ""
    for _, p in ipairs(method.params) do
        defineParam(p, argIdx)
        argIdx = argIdx + 1
        
        if #params > 0 then
          params = params .. ", "
        end

        if p.isNamed then
          params = params .. p.paramName .. ": "
        end

        params = params .. p.paramName
    end
    
    funcBuf:writeln()
    if not returnVoid then
        funcBuf:write("    var result_ = ")
    else
        funcBuf:write("    ")
    end

    --todo
    if method.isDefaultConstructor then
        funcBuf:writeln("%s(%s);", className, params) --default constructor
    elseif method.isConstructor or method.isStatic then
        funcBuf:writeln("%s.%s(%s);", className, methodName, params) --static method or constructor
    else
        funcBuf:writeln("self.%s(%s);", methodName, params)
    end

    funcBuf:writeln()
    if returnVoid then
        funcBuf:writeln("    return 0;")
    else 
        funcBuf:writeln("    return luaPush(L, result_);")
    end

    funcBuf:writeln()
    funcBuf:writeln("  } catch (e, stacktrace) {")
    funcBuf:writeln("    luaL_error(L, '$e\\n$stacktrace');")
    funcBuf:writeln("    return 0;")
    funcBuf:writeln("  }")

    funcBuf:writeln("}")

    bindBuf:writeln("  address = ffi.Pointer.fromFunction<lua_CFunction>(%s, exceptionalReturn).address;", functionName)
    if method.isDefaultConstructor then
        bindBuf:writeln("  luaRegisterMethod(L, '%s', '__call', address);", className)
    else
        bindBuf:writeln("  luaRegisterMethod(L, '%s', '%s', address);", className, methodName)
    end
end

local function genFunction(method)
    local methodName = method.name
    local argIdx = 1

    local returnVoid = (method.returnType == "void")

    funcBuf:writeln()
    bindBuf:writeln()
  
    funcBuf:writeln("int _%s(VoidPtr L) {", methodName)
    funcBuf:writeln("  try {")
    
    funcBuf:writeln()
    funcBuf:writeln("    int top_ = lua_gettop(L); assert(top_ >= 0);")
    
    local params = ""
    for _, p in ipairs(method.params) do
        defineParam(p, argIdx)
        argIdx = argIdx + 1
        
        if #params > 0 then
          params = params .. ", "
        end

        if p.isNamed then
          params = params .. p.paramName .. ": "
        end

        params = params .. p.paramName
    end
    
    funcBuf:writeln()
    if not returnVoid then
        funcBuf:write("    var result_ = ")
    else
        funcBuf:write("    ")
    end

    funcBuf:writeln("%s(%s);", methodName, params)

    funcBuf:writeln()
    if returnVoid then
        funcBuf:writeln("    return 0;")
    else 
        funcBuf:writeln("    return luaPush(L, result_);")
    end

    funcBuf:writeln()
    funcBuf:writeln("  } catch (e, stacktrace) {")
    funcBuf:writeln("    luaL_error(L, '$e\\n$stacktrace');")
    funcBuf:writeln("    return 0;")
    funcBuf:writeln("  }")

    funcBuf:writeln("}")

    bindBuf:writeln("  address = ffi.Pointer.fromFunction<lua_CFunction>(_%s, exceptionalReturn).address;", methodName)
    bindBuf:writeln("  luaRegisterFunction(L, '%s', address);", methodName)
end

function genVariables(cls)
    bindBuf:writeln("  addressGet = 0;")
    bindBuf:writeln("  addressSet = 0;")

    local className = cls.name
    
    local hasStaticVar
    for _, v in ipairs(cls.vars) do
        if v.isStatic and v.canRead then
            hasStaticVar = true
            break
        end
    end
    
    local hasNonStaticVar
    for _, v in ipairs(cls.vars) do
        if (not v.isStatic) and v.canRead then
            hasNonStaticVar = true
            break
        end
    end

    if hasStaticVar or hasNonStaticVar then
        funcBuf:writeln()
        funcBuf:writeln("int _%s_getProp_(VoidPtr L) {", className)
        funcBuf:writeln("  var propName = Symbol(luaL_checkstring(L, 2).toDartString());")
        
        if hasStaticVar then
            funcBuf:writeln()
            funcBuf:writeln("  switch(propName) {")
            for _, v in ipairs(cls.vars) do
                if v.isStatic and v.canRead then
                    funcBuf:writeln("    case #%s: return luaPush(L, %s.%s);", v.name, className, v.name)
                end
            end
            funcBuf:writeln("  }")
        end
        
        if hasNonStaticVar then
            funcBuf:writeln()
            funcBuf:writeln("  var object = luaToObjectT<%s>(L, 1);", className)
            funcBuf:writeln("  if (object == null) {")
            funcBuf:writeln("    lua_pushnil(L);")
            funcBuf:writeln("    return 1;")
            funcBuf:writeln("  }")
            funcBuf:writeln()
            funcBuf:writeln("  switch(propName) {")
            for _, v in ipairs(cls.vars) do
                if not v.isStatic  and v.canRead then
                    funcBuf:writeln("    case #%s: return luaPush(L, object.%s);", v.name, v.name)
                end
            end
            funcBuf:writeln("  }")
        end

        funcBuf:writeln();
        funcBuf:writeln("  lua_pushnil(L);")
        funcBuf:writeln("  return 1;")
        funcBuf:writeln("}")

        bindBuf:writeln("  addressGet = ffi.Pointer.fromFunction<lua_CFunction>(_%s_getProp_, exceptionalReturn).address;", cls.name)
    end

    --set prop

    hasStaticVar = false
    for _, v in ipairs(cls.vars) do
        if v.isStatic and v.canWrite then
            hasStaticVar = true
            break
        end
    end
    
    hasNonStaticVar = false
    for _, v in ipairs(cls.vars) do
        if (not v.isStatic) and v.canWrite then
            hasNonStaticVar = true
            break
        end
    end

    if hasStaticVar or hasNonStaticVar then
        funcBuf:writeln()
        funcBuf:writeln("int _%s_setProp_(VoidPtr L) {", className)
        funcBuf:writeln("  var propName = Symbol(luaL_checkstring(L, 2).toDartString());")
        funcBuf:writeln("  var result = false;")
        
        if hasStaticVar then
            funcBuf:writeln()
            funcBuf:writeln("  switch(propName) {")
            for _, v in ipairs(cls.vars) do
                if v.isStatic and v.canWrite then
                    funcBuf:writeln("    case #%s: %s.%s = luaTo<%s>(L, 3)%s; result = true; break;", v.name, className, v.name, v.type, v.nullable and "" or "!")
                end
            end
            funcBuf:writeln("  }")
            
            funcBuf:writeln()
            funcBuf:writeln("  if (result) {")
            funcBuf:writeln("    lua_pushboolean(L, result);")
            funcBuf:writeln("    return 1;")
            funcBuf:writeln("  }")
        end
        
        if hasNonStaticVar then
            funcBuf:writeln()
            funcBuf:writeln("  var object = luaToObjectT<%s>(L, 1);", className)
            funcBuf:writeln("  if (object == null) {")
            funcBuf:writeln("    lua_pushboolean(L, result);")
            funcBuf:writeln("    return 1;")
            funcBuf:writeln("  }")
            funcBuf:writeln()
            funcBuf:writeln("  switch(propName) {")
            for _, v in ipairs(cls.vars) do
                if not v.isStatic  and v.canWrite then
                    funcBuf:writeln("    case #%s: object.%s = luaTo<%s>(L, 3)%s; result = true; break;", v.name, v.name, v.type, v.nullable and "" or "!")
                end
            end
            funcBuf:writeln("  }")
        end

        funcBuf:writeln()
        funcBuf:writeln("  lua_pushboolean(L, result);")
        funcBuf:writeln("  return 1;")
        funcBuf:writeln("}")

        bindBuf:writeln("  addressSet = ffi.Pointer.fromFunction<lua_CFunction>(_%s_setProp_, exceptionalReturn).address;", cls.name)
    end
end

function genLua()
    --class
    for _, cls in ipairs(classes) do
        bindBuf:writeln()
        
        if #cls.vars == 0 then --vars is empty
            bindBuf:writeln("  luaRegisterClass(L, '%s', '%s', 0, 0);", cls.name, cls.super)
        else
            genVariables(cls)
            bindBuf:writeln("  luaRegisterClass(L, '%s', '%s', addressGet, addressSet);", cls.name, cls.super)
        end

        for _, type in ipairs(cls.alias) do
            bindBuf:writeln("  luaAlias(L, '%s', '%s');", type, cls.name)
        end

        for _, method in ipairs(cls.methods) do
            funcBuf:writeln()
            genMothod(cls, method)
        end
    end

    for _, v in ipairs(functions) do
        genFunction(v)
    end

    --enum
    for _, e in ipairs(enums) do
        bindBuf:writeln()
        if not classes[e.name] then
            bindBuf:writeln("  assert((){var b = (luaGetValue(L, '%s') == LUA_TNIL); lua_pop(L, 1); return b;}());", e.name)
        end
        
        if e.values then
            for _, v in ipairs(e.values) do
                bindBuf:writeln("  luaSetObject(L, '%s.%s', %s.%s);", e.name, v, e.name, v)
            end
        else
            bindBuf:writeln("  luaRegisterEnum(L, %s, %s.values);", e.name, e.name)
        end
    end
end

require "dartTypes"

beginGenLua()
genLua()
endGenLua()

require "dart2ts"
beginGenTS()
genTS()
endGenTS()
