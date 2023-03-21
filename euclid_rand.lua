--
-- Euclidean rhythm with chance
--


function euclidean (k, n, s)
    assert(k <= n, "events should count fewer than steps")

    local function merge_tail_to (mt, dst)
        for _,v in ipairs(table.remove(mt)) do
            table.insert(mt[dst], v)
        end

        return mt
    end

    local nt = {}
    for i=1,n do
        table.insert(nt, {i <= k and 1 or 0})
    end

    for x,y in ipairs(nt) do
        print(x .. ':\t' .. table.concat(y, ' '))
    end

    -- TODO end condition here is wrong
    while #nt > k do
        merged = 0
        for i=1,math.min(k, #nt-k) do
            merge_tail_to(nt, i)
            merged = merged +1
        end
        for x,y in ipairs(nt) do
            print(x .. ':\t' .. table.concat(y, ' '))
        end
    end
    print('---' ..merged .. ' == ' .. #nt-merged)

    for i=1,#nt-merged-merged do
        merge_tail_to(nt, i)
    end
    for x,y in ipairs(nt) do
        print(x .. ':\t' .. table.concat(y, ' '))
    end

    while #nt > 1 do    -- flatten the table
        merge_tail_to(nt, #nt-1)
    end

    if s then
        return nt[1][s % n]
    else
        return nt[1]
    end
end

k = 7  -- events
n = 16  -- steps

er = euclidean(k, n)
print(table.concat(er, ' '))
