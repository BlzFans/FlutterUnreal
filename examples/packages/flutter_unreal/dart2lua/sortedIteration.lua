--http://lua-users.org/wiki/SortedIteration

--[[
Ordered table iterator, allow to iterate on the natural order of the keys of a
table.

Example:
]]

local function __genOrderedIndex( t )
    local orderedIndex = {}
    for key in pairs(t) do
        table.insert( orderedIndex, key )
    end
    table.sort( orderedIndex )
    return orderedIndex
end

local function orderedNext(t, state)
    -- Equivalent of the next function, but returns the keys in the alphabetic
    -- order. We use a temporary ordered key table that is stored in the
    -- table being iterated.

    local key = nil
    --print("orderedNext: state = "..tostring(state) )
    if state == nil then
        -- the first time, generate the index
        t.__orderedIndex = __genOrderedIndex( t )
        key = t.__orderedIndex[1]
    else
        -- fetch the next value
        for i = 1,#(t.__orderedIndex) do
            if t.__orderedIndex[i] == state then
                key = t.__orderedIndex[i+1]
            end
        end
    end

    if key then
        return key, t[key]
    end

    -- no more value to return, cleanup
    t.__orderedIndex = nil
    return
end

function orderedPairs(t)
    -- Equivalent of the pairs() function on tables. Allows to iterate
    -- in order
    return orderedNext, t, nil
end

--[[
t = {
    ['a'] = 'xxx',
    ['b'] = 'xxx',
    ['c'] = 'xxx',
    ['d'] = 'xxx',
    ['e'] = 'xxx',
}

print("Normal iterating with pairs")
for key, val in pairs(t) do
    print(key.." : "..val)
end

print("Ordered iterating")
for key, val in orderedPairs(t) do
    print(key.." : "..val)
end
]]

--[[ Result:
Normal iterating with pairs
a : xxx
c : xxx
b : xxx
e : xxx
d : xxx
Ordered iterating
a : xxx
b : xxx
c : xxx
d : xxx
e : xxx
]]
