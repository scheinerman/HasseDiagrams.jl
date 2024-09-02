module HasseDiagrams

using Posets
using Graphs
using SimpleDrawing
using Plots
using LayeredLayouts

import Base: show
import SimpleDrawing: draw, draw!

export HasseDiagram,
    basic_layout,
    dim2_layout,
    layered_layout,
    draw,
    get_font_size,
    set_font_size!,
    get_radius,
    set_radius!,
    set_fill_color!,
    get_fill_color,
    set_labels!,
    get_labels,
    set_xy!,
    get_xy,
    scalex!,
    scaley!,
    scale!

const FONT_SIZE = 10
const RADIUS = 12
const FILL_COLOR = :white

mutable struct HasseDiagram
    p::Poset
    xy::Dict{Int,Vector{Float64}}
    radius::Real
    fill_color::Symbol

    labels::Dict{Int,Any}
    font_size::Int

    function HasseDiagram(p::Poset)
        n = nv(p)
        xy = basic_layout(p)
        labels = Dict{Int,Any}()
        for v in 1:n
            labels[v] = v
        end

        return new(p, xy, RADIUS, FILL_COLOR, labels, FONT_SIZE)
    end
end

show(io::IO, h::HasseDiagram) = print(io, "Hasse diagram of a $(h.p)")

include("get-set.jl")
include("draw.jl")
include("scaling.jl")

include("layout_functions/basic_layout.jl")
include("layout_functions/dim2_layout.jl")
include("layout_functions/layered_layout.jl")

end # module HasseDiagrams
