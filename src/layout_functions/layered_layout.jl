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
