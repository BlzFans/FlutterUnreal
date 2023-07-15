
require "sortedIteration"
local StringBuilder = require "StringBuilder"
local typesBuf = StringBuilder()


local unknown_types = {}

function beginGenTS()
    typesBuf:clear()
    typesBuf:writeln()
    typesBuf:writeln()
    typesBuf:writeln()
    typesBuf:writeln("type int = number")
    typesBuf:writeln("type double = number")
    typesBuf:writeln("type bool = boolean")
end

local function convertType(t)    
    if t == "bool" or t == "double" or t == "int" or t == "void" then
        return t
    end

    if t == "String" then
        return "string"
    end
    
    for _, cls in ipairs(classes) do
        if t == cls.name then
            return t
        end
    end
    
    for _, e in ipairs(enums) do
        if t == e.name then
            return t
        end
    end
    
    if callbackFunctions[t] then
        return t:gsub("<", "_"):gsub(">", "_"):gsub("?", "_") --ValueChanged<Color> to ValueChanged_Color_
    end

    --Generics
    if t:find("<") and t:find(">") then
        return "unknown"
    end
    
    unknown_types[t] = 1
    
    return t
end

local function genParams(cls, method)    
    local hasPositionalParam = false
    local namedParamsType = ""
    local namedParams = ""
    local namedParamsIsRequired
    
    for i, p in ipairs(method.params) do
        if p.isNamed then
            if #namedParams == 0 then
                namedParams = "{"
                namedParamsType = "{"
            else
                namedParams = namedParams .. ", "
                namedParamsType = namedParamsType .. ", "
            end
            
            namedParams = namedParams .. p.paramName
            namedParamsType = namedParamsType .. p.paramName
                                    
            if p.defaultValue or p.nullable then
                namedParamsType = namedParamsType .. "?"
            else
                namedParamsIsRequired = true
            end
            
            if p.isList or p.isSet then
                namedParamsType = namedParamsType .. ":" .. convertType(p.paramType) .. "[]"
            elseif p.isMap then
                local types = p.paramType:split(",")
                local U = types[1]:trim()
                local V = types[2]:trim()
                namedParamsType = namedParamsType .. ":" .. string.format("{[id: %s]: %s}", convertType(U), convertType(V))
            else
                namedParamsType = namedParamsType .. ":" .. convertType(p.paramType)
            end
            
        else
            hasPositionalParam = true
            if i > 1 then
                typesBuf:write(", ")
            end
            
            typesBuf:write(p.paramName)
            if p.defaultValue or p.nullable then
                typesBuf:write("?")
            end
            
            if p.isList or p.isSet then
                typesBuf:write(":%s[]", convertType(p.paramType))
            elseif p.isMap then
                local types = p.paramType:split(",")
                local U = types[1]:trim()
                local V = types[2]:trim()
                typesBuf:write(":{[id: %s]: %s}", convertType(U), convertType(V))
            else
                typesBuf:write(":%s", convertType(p.paramType))
            end
        end
    end
    
    if #namedParams > 0 then
        namedParams = namedParams .. "}"
        namedParamsType = namedParamsType .. "}"
        if hasPositionalParam then
            typesBuf:write(", ")
        end
        typesBuf:write(namedParams)
        
        if not namedParamsIsRequired then
            typesBuf:write("?")
        end
        
        typesBuf:write(" : %s", namedParamsType)
    end
end

local function genClass(cls)
    local hasDefaultConstructor
    local hasStatic

    --dart generics type
    if cls.name:contains("<") then
        return
    end
    
    --interface: instance method and variable
    typesBuf:writeln()
    typesBuf:write("interface %s", cls.name)
    if cls.super and #cls.super > 0 then
        typesBuf:write(" extends %s", cls.super)
    end
    typesBuf:writeln(" {")
    
    for _, method in ipairs(cls.methods) do
        if method.isDefaultConstructor then
            hasDefaultConstructor = true
        elseif method.isConstructor or method.isStatic then
            hasStatic = true
        else
            typesBuf:writeln()
            typesBuf:write("    %s(", method.name)
            genParams(cls, method)
            typesBuf:writeln(" ):%s", convertType(method.returnType))
        end
    end
    
    for _, v in ipairs(cls.vars) do
        if v.isStatic then
            hasStatic = true
        else
            typesBuf:writeln()
            if v.canWrite then
                typesBuf:writeln("    %s: %s", v.name, convertType(v.type))
            else
                typesBuf:writeln("    readonly %s: %s", v.name, convertType(v.type))
            end
        end
    end

    typesBuf:writeln("}")
    
    --default constructor
    if hasDefaultConstructor then
        for _, method in ipairs(cls.methods) do
            if method.isDefaultConstructor then
                typesBuf:writeln()
                typesBuf:write("declare function %s(", cls.name)
                genParams(cls, method)
                typesBuf:writeln("):%s", method.returnType)
            end
        end
    end
    
    --class static method and variable
    --namespace static method and variable
    if hasStatic then
        typesBuf:writeln()
        --[[
        typesBuf:writeln("declare class %s {", cls.name)
        for _, method in ipairs(cls.methods) do
            if (not method.isDefaultConstructor and method.isConstructor) or method.isStatic then
                typesBuf:writeln()
                typesBuf:writeln("    /** @noSelf **/")
                typesBuf:write("    static %s(", method.name)
                genParams(cls, method)
                typesBuf:writeln("):%s", convertType(method.returnType))
            end
        end

        for _, v in ipairs(cls.vars) do
            if v.isStatic then
                typesBuf:writeln()
                if v.canWrite then
                    typesBuf:writeln("    static %s: %s", v.name, convertType(v.type))
                else
                    typesBuf:writeln("    static %s: %s", v.name, convertType(v.type))
                end
            end
        end
        ]]

        typesBuf:writeln("declare namespace %s {", cls.name)
        for _, method in ipairs(cls.methods) do
            if (not method.isDefaultConstructor and method.isConstructor) or method.isStatic then
                typesBuf:writeln()
                typesBuf:write("    function %s(", method.name)
                genParams(cls, method)
                typesBuf:writeln("):%s", convertType(method.returnType))
            end
        end

        for _, v in ipairs(cls.vars) do
            if v.isStatic then
                typesBuf:writeln()
                if v.canWrite then
                    typesBuf:writeln("    let %s: %s", v.name, convertType(v.type))
                else
                    typesBuf:writeln("    const %s: %s", v.name, convertType(v.type))
                end
            end
        end
    
        typesBuf:writeln("}")
    end
end

local function genFunction(method)
    typesBuf:writeln()
    typesBuf:write("declare function %s(", method.name)
    genParams(cls, method)
    typesBuf:writeln(" ):%s", convertType(method.returnType))
end

function genTS()
    --class
    for _, cls in ipairs(classes) do
        if cls.name ~= "double" then
            genClass(cls)
        end
    end

    for _, v in ipairs(functions) do
        genFunction(v)
    end
    
    for k, v in orderedPairs(unknown_types) do
        typesBuf:writeln()
        typesBuf:writeln("interface %s {}", k)
    end

    --enum
    for _, e in ipairs(enums) do
        typesBuf:writeln()
        typesBuf:writeln("declare class %s {", e.name)    
        if e.values then
            for k, v in ipairs(e.values) do                
                typesBuf:writeln("    static %s:%s", v, e.values.type or e.name)
            end
        else

        end
        typesBuf:writeln("}")
    end
    
    --callback
    for k, v in orderedPairs(callbackFunctions) do
        typesBuf:writeln()
        typesBuf:writeln("type %s = %s", k:gsub("<", "_"):gsub(">", "_"):gsub("?", "_"), v[2])
    end
end

function endGenTS()
    local f = assert(io.open("../typescript/src/flutter_types.d.ts", "w"))
    f:write(typesBuf:str())
    f:close()
    
    local f = assert(io.open("../../../typescript_example/src/flutter_types.d.ts", "w"))
    f:write(typesBuf:str())
    f:close()
end
