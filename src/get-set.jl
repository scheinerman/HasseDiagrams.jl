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

"""
    set_xy(h::HasseDiagram, method::Function=basic_layout)

Give the Hasse diagram `h` an embedding using `method`.
"""
function set_xy(h::HasseDiagram, method::Function=basic_layout)
    h.xy = method(h.p)
    return nothing
end

"""
    set_xy(h::HasseDiagram, xy::Dict{Int,Vector})

Give the Hasse diagram an embedding from a dictionary. If a vertex 
does not appear in `xy`, then its position is unchanged. 
"""
function set_xy(h::HasseDiagram, xy::Dict{Int,Vector{T}}) where {T}
    n = nv(h.p)
    for v in 1:n
        if haskey(xy, v)
            h.xy[v] = xy[v]
        end
    end
    return nothing
end

"""
    get_xy(h::HasseDiagram)

Return a copy of the embedding of `h`. 
"""
get_xy(h::HasseDiagram) = deepcopy(h.xy)

function set_labels(h::HasseDiagram, labs::Dict{Int,T}) where {T}
    n = nv(h.p)
    for v in 1:n
        if haskey(labs, v)
            h.labels[v] = labs[v]
        end
    end
end

function set_labels(h::HasseDiagram)
    labs = Dict{Int,Int}()
    for v in 1:nv(h.p)
        labs[v] = v
    end
    return set_labels(h, labs)
end

get_labels(h::HasseDiagram) = deepcopy(h.labels)
