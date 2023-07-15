
function math.clamp(v, a, b)
    if v < a then
        return a
    end
    if v > b then
        return b
    end
    return v
end

function file_exists(name)
    local f=io.open(name,"r")
    if f~=nil then io.close(f) 
        return true 
    else 
        return false 
    end
end
