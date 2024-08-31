"""
    set_font_size(h::HasseDiagram, sz::Int=FONT_SIZE)

Set the font size of `h`.
"""
set_font_size(h::HasseDiagram, sz::Int=FONT_SIZE) = h.font_size = sz < 1 ? 0 : sz
"""
    get_font_size(h::HasseDiagram)

Return the font size of `h`.
"""
get_font_size(h::HasseDiagram) = h.font_size

"""
    set_radius(h::HasseDiagram, r::Int=RADIUS)

Set the vertex radius of `h`.
"""
set_radius(h::HasseDiagram, r::Int=RADIUS) = h.radius = r < 1 ? 0 : r
"""
    get_radius(h::HasseDiagram)

Return the vertex radius of `h`.
"""
get_radius(h::HasseDiagram) = h.radius

"""
    set_fill_color(h::HasseDiagram, fill=FILL_COLOR)

Set the vertex color for `h`.
"""
set_fill_color(h::HasseDiagram, fill=FILL_COLOR) = h.fill_color = fill
"""
    get_fill_color(h::HasseDiagram)

Return the vertex color for `h`.
"""
get_fill_color(h::HasseDiagram) = h.fill_color
