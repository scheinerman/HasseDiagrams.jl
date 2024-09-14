"""
    layered_layout(p::Poset)

Create a layered layout for `p`. This is a Sugiyaqma style layout 
from the `LayeredLayouts` module. Can be slow. 
"""
function layered_layout(p::Poset)
    xy = Dict{Int,Vector{Float64}}()

    if nv(p) == 0
        return xy
    end

    x, y, _ = solve_positions(Zarate(), cover_digraph(p))
    for v in 1:nv(p)
        xy[v] = [y[v]; x[v]]
    end
    return xy
end

"""
    layered_layout_2(p::Poset)

A variation on `layered_layout`.
We compute `layered_layout` but then tweak `y`-coordinates 
based on `dual_ranking`.
"""
function layered_layout_2(p::Poset)
    xy = layered_layout(p)
    rk = dual_ranking(p)

    for v in 1:nv(p)
        x = xy[v][1]
        y = rk[v]
        xy[v] = [x, y]
    end

    return xy
end
