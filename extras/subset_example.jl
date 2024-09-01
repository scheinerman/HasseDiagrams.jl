using Posets, HasseDiagrams, SimpleDrawing, ShowSet

function draw_bool(k)
    p = subset_lattice(k)
    h = HasseDiagram(p)
    labs = Dict{Int,String}()
    for v in 1:nv(p)
        labs[v] = string(subset_decode(v))
    end
    set_labels(h, labs)
    set_font_size(h, 8)
    set_radius(h, 30)
    set_fill_color(h, :lightblue)
    set_xy(h, layered_layout)
    draw(h)
    return expand_canvas()  # from SimpleDrawing
end
