local GUtils = {}

-- 1. Initialize the array with the range [min, max]
function GUtils.create_range(min, max)
    local t = {}
    for i = min, max do
        t[i - min + 1] = i
    end
    return t
end

-- 2. Fisher-Yates Shuffle Algorithm
function GUtils.shuffle(t)
    for i = #t, 2, -1 do
        local j = math.random(i)
        t[i], t[j] = t[j], t[i]
    end
    return t
end

function GUtils.nslice(tnotes, nn)
    local slice = table.move(tnotes, 1, nn, 1, {})
    return slice
end

-- Usage Example
math.randomseed(os.time()) -- Seed for randomness
local my_array = GUtils.create_range(1, 10)
local shuffled_array = GUtils.shuffle(my_array)

for _, val in ipairs(shuffled_array) do
    print(val)
end   

return GUtils