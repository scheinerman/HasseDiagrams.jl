"""
    layered_layout_2(p::Poset)

A variation on `layered_layout`, and not in a good way.
We compute `layered_layout` but then tweak `y`-coordinates 
based on `dual_ranking`.
"""
function layered_layout_2(p::Poset)
    xy = layered_layout(p)
    rk = dual_ranking(p)

    for v = 1:nv(p)
        x = xy[v][1]
        y = rk[v]
        xy[v] = [x,y]
    end

    return xy

end