
"""
    _edge_energy(x1, y1, x2, y2, hook=1.0)

This is the energy in the spring that pulls adjacent vertices together. 
Applies to vertices `u` and `v` is one is the cover of the other in the poset.

The greater `hook` is, the stronger the attraction.
"""
function _edge_energy(x1, y1, x2, y2, hook=1.0)
    d2 = (x1 - x2)^2 + (y1 - y2)^2   # squared distance
    return hook * d2
end

"""
    _repel_energy(x1, y1, x2, y2, elect=1.0)

All pairs of vertices repel each other. The greater `elect` is 
the stronger the repulsion.
"""
function _repel_energy(x1, y1, x2, y2, elect=1.0)
    d2 = (x1 - x2)^2 + (y1 - y2)^2   # squared distance
    return elect / sqrt(d2 + 0.1)
end

"""
    _total_energy(
        g::Graph, x::Vector{T}, y::Vector{T}, hook=1.0, elect=1.0
        ) where {T<:Real}
       
Total energy from edge springs and vertex-vertex repulsion.
"""
function _total_energy(
    g::Graph, x::Vector{T}, y::Vector{T}, hook=1.0, elect=1.0
) where {T<:Real}
    result = 0.0
    n = nv(g)

    for e in edges(g)
        u = src(e)
        v = dst(e)
        result += _edge_energy(x[u], y[u], x[v], y[v], hook)
    end

    for u in 1:(n - 1)
        for v in (u + 1):n
            result += _repel_energy(x[u], y[u], x[v], y[v], elect)
        end
    end

    return result
end

"""
    _make_energy_function(p::Poset, xy::Dict, hook=1.0, elect=1.0)

Create the function to be minimized.
"""
function _make_energy_function(p::Poset, xy::Dict, hook=1.0, elect=4.0)
    g = Graph(cover_digraph(p))
    n = nv(g)
    y = [xy[k][2] for k in 1:n]  # get the y-vals from current embedding
    return x -> _total_energy(g, x, y, hook, elect)
end

"""
    force_layout(p::Poset)

Compute a poset in which the edges of the cover digraph act like springs and 
the nodes act like repelling particles. The y-coordinates are determined by 
`layered_layout_2` and then we optimize the x-coordinates. Sometimes gives good
images, but can be sluggish. 
"""
function force_layout(p::Poset)
    xy = layered_layout_2(p)
    x0 = [xy[v][1] for v in 1:nv(p)]
    f = _make_energy_function(p, xy)

    result = optimize(f, x0)
    x_final = Optim.minimizer(result)

    for v in 1:nv(p)
        x = x_final[v]
        y = xy[v][2]
        xy[v] = [x, y]
    end
    return xy
end
