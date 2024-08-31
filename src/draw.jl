function draw(h::HasseDiagram)
    newdraw()
    p = h.p
    g = cover_digraph(p)

    for e in edges(g)
        u = src(e)
        v = dst(e)
        draw_segment(h.xy[u]...,h.xy[v]..., linecolor=:black)
    end
    finish()

end