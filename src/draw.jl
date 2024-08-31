function draw!(h::HasseDiagram)
    p = h.p
    g = cover_digraph(p)

    for e in edges(g)
        u = src(e)
        v = dst(e)
        draw_segment(h.xy[u]..., h.xy[v]...; linecolor=:black)
    end

    for v in 1:nv(p)
        draw_point(h.xy[v]...; marker=h.radius, linecolor=:black, color=h.fill_color)
        if h.font_size > 0
            annotate!(h.xy[v]..., v, h.font_size)
        end
    end

    return finish()
end

function draw(h::HasseDiagram)
    newdraw()
    return draw!(h)
end
