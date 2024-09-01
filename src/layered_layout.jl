function layered_layout(p::Poset)
    x, y, _ = solve_positions(Zarate(), cover_digraph(p))
    xy = Dict{Int,Vector{Float64}}()
    for v in 1:nv(p)
        xy[v] = [y[v]; x[v]]
    end
    return xy
end
