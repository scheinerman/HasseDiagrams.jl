"""
    draw!(h::HasseDiagram)

Draw the Hasse diagram without first erasing the canvas. 
"""
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
            annotate!(h.xy[v]..., h.labels[v], h.font_size)
        end
    end

    return finish()
end

"""
    draw(h::HasseDiagram)

Draw the Hasse diagram on a blank canvas.
"""
function draw(h::HasseDiagram)
    newdraw()
    return draw!(h)
end

_direct_draw_warning = "Drawing a poset with defaults. Better to use draw(HasseDiagram(p))"

function draw!(p::Poset)
    @warn _direct_draw_warning
    return draw!(HasseDiagram(p))
end

function draw(p::Poset)
    newdraw()
    return draw!(p)
end
