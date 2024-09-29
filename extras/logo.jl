using Posets, HasseDiagrams, Plots, SimpleDrawing

function hasse_logo()
    p = chain(1) / (chain(2) + chain(1)) / chain(1)
    p = p'
    h = HasseDiagram(p)
    set_xy!(h, force_layout)
    scalex!(h, 1.5)
    set_radius!(h, 32)
    set_font_size!(h, 30)

    draw(h)
    expand_canvas()
    return finish()
end
