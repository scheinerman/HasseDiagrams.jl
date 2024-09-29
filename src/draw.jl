"""
    make_objects(h::HasseDiagram)

Create a list of `SimpleDrawingObject`s representing the edges and vertices of `h`.
The list starts with all the edges followed by all the vertices. 
"""
function make_objects(h::HasseDiagram)
    p = h.p
    n = nv(p)
    g = cover_digraph(p)

    e_list = [Segment(h.xy[src(e)]..., h.xy[dst(e)]...) for e in edges(g)]
    v_list = [Point(h.xy[v]...) for v in 1:n]

    for p in v_list
        set_pointsize!(p, h.radius)
        set_fillcolor!(p, h.fill_color)
    end

    return [e_list; v_list]
end

"""
    draw!(h::HasseDiagram)

Draw the Hasse diagram without first erasing the canvas. 
"""
function draw!(h::HasseDiagram)
    draw(make_objects(h))

    for v in 1:nv(h.p)
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
