--[[
    A simple class to help build up strings

    Usage:
    local sb = StringBuilder();
    sb:append("this ")
    sb:append("is a ")
    sb:append("long ")
    sb:append("string.")

    print(sb:toString())

    You can also do it this way:

    local sb = StringBuilder();
    sb.."this ".."is a ".."long ".."string."

    But, that's more wasteful as mostly it's doing regular string concatenation
    until the final 'this', which is appended to the string builder.
--]]

local table = table;

local StringBuilder = {}
setmetatable(StringBuilder, {
    __call = function(self, ...)
        return self:create(...);
    end,
})

local StringBuilder_mt = {
    __index = StringBuilder;
    
    __add = function(self, ...)
    --print("__add")
        return self:append(...)
    end,

    __concat = function(self, ...)
    --print("__concat: ", select(1, ...))
        return self:append(...)
    end,

    __tostring = function(self)
        return self:toString();
	end,
}

function StringBuilder.init(self, ...)
    local obj = {
        accumulator = {}
    }
    setmetatable(obj, StringBuilder_mt)

    return obj;
end

function StringBuilder.create(self, ...)
    return self:init(...)
end

function StringBuilder.empty(self)
    return #self.accumulator == 0;
end

--[[
    The append can deal with two cases.
    1) The 'other' is a simple string, in which case 
    we just append it to our list and  move on. 
    2) The 'other' represents another table, and that table 
    is itself a StringBuilder.
]]
function StringBuilder.append(self, other)
    if type(other) == "string" then
        table.insert(self.accumulator, other)
        return self
    elseif type(other) == "table" then
        if other.accumulator ~= nil then
            for _, value in ipairs(other.accumulator) do
                table.insert(self.accumulator, value)
            end
        end
    end
    

    return self;
end

function StringBuilder.toString(self, perLine)
    perLine = perLine or ""
    return table.concat(self.accumulator, perLine)
end

function StringBuilder.str(self)
    return table.concat(self.accumulator);
end

function StringBuilder.write(self, ...)
    if #{...} == 0 then
        return
    end
    
    local s = string.format(...)
    self:append(s)
end

function StringBuilder.writeln(self, ...)
    self:write(...)
    self:append('\n')
end

function StringBuilder.clear(self)
    self.accumulator = {}
end

return StringBuilder
