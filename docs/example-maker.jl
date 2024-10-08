using Posets, HasseDiagrams, SimpleDrawing, Plots

function draw_examples(p::Poset)
    h = HasseDiagram(p)

    set_xy!(h, basic_layout)
    draw(h)
    expand_canvas()
    title!("set_xy!(h, basic_layout) [default]")
    savefig("basic.png")

    set_xy!(h, dim2_layout)
    draw(h)
    expand_canvas()
    title!("set_xy!(h, dim2_layout)")
    savefig("dim2.png")

    set_xy!(h, layered_layout)
    draw(h)
    expand_canvas()
    title!("set_xy!(h, layered_layout)")
    savefig("layered.png")

    set_xy!(h, force_layout)
    draw(h)
    expand_canvas()
    title!("set_xy!(h, force_layout)")
    savefig("force.png")

    return nothing
end
