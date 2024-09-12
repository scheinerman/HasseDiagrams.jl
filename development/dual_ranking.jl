
"""
    dual_ranking(p::Poset)

A variant on `ranking` from `Posets` using `ranking` on both `p` 
and it's dual. 
"""
function dual_ranking(p::Poset)
    r1 = ranking(p)
    r2 = ranking(p')
    n = nv(p)

    for v in 1:n
        r1[v] -= r2[v]
    end

    vals = unique(sort(collect(values(r1))))
    nvals = length(vals)

    lookup = Dict{Int,Int}()

    for idx in 1:nvals
        v = vals[idx]
        lookup[v] = idx
    end

    @show vals
    @show lookup

    rk = Dict{Int,Int}()
    for v in 1:n
        rk[v] = lookup[r1[v]] - 1
    end

    return rk
end

"""
    basic_layout_2(p::Poset)

Alternative layout algorithm for Hasse diagrams using `dual_ranking` for the
vertical and then elements at the same level are evenly spread out horizontally.
"""
function basic_layout_2(p::Poset)
    n = nv(p)
    xy = Dict{Int,Vector{Float64}}()

    if n == 0
        return xy
    end

    x = Dict{Int,Float64}()   # x-coordinates
    y = Dict{Int,Float64}()   # y-coordinates
    rk = dual_ranking(p)

    # y coordinate is just the rank
    for v in 1:n
        y[v] = rk[v]
    end

    # all elements of same rank are spread equally around 0
    max_rank = maximum(values(rk))

    for r in 0:max_rank
        vtcs = [v for v in 1:n if rk[v] == r]  # vertices at rank r
        left = 0.5 * (1 - length(vtcs))
        for i in 1:length(vtcs)
            v = vtcs[i]
            x[v] = left + i - 1
        end
    end

    for v in 1:n
        xy[v] = [x[v]; y[v]]
    end
    return xy
end
