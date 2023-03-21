--
-- Euclidean rhythm with chance
--

function list_table(mt)
    for _,x in ipairs(mt) do
        io.write('[ ')
        for _,y in ipairs(x) do
            io.write(y .. ' ')
        end
        io.write(']  ')
    end
    io.write('\n')
end

function euclidean(k, n)
    assert(k <= n, "events should count fewer than steps")

    local function merge_tail_to(mt, dst)
        for _,v in ipairs(table.remove(mt)) do
            table.insert(mt[dst], v)
        end
        return mt
    end

    local nt = {}
    for i=1,n do
        table.insert(nt, {i <= k and 1 or 0})
    end

    list_table(nt)
    local to_merge = math.min(#nt-k, k, math.floor(#nt/2), #nt-math.floor(#nt/2))
    while to_merge >= 1 do
        for i=1,to_merge do
            merge_tail_to(nt, i)
        end
        list_table(nt)
        to_merge = math.min(math.floor(#nt/2), #nt-math.floor(#nt/2))
    end

    return nt[1]
end

k = 3  -- events
n = 8  -- steps

er = euclidean(k, n)
print('k:' .. k .. ', n:' .. n .. ' [ ' .. table.concat(er, ' ') .. ' ]')
