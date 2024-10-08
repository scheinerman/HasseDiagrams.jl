"""
    basic_layout(p::Poset)

Basic layout of a poset based on `ranking(p)`. The `y`-coordinate is 
simply the level assigned by `ranking` and all elements at the same 
level are evenly distributed horizontally. 
"""
function basic_layout(p::Poset)
    n = nv(p)
    xy = Dict{Int,Vector{Float64}}()

    if n == 0
        return xy
    end

    x = Dict{Int,Float64}()   # x-coordinates
    y = Dict{Int,Float64}()   # y-coordinates
    rk = ranking(p)

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
