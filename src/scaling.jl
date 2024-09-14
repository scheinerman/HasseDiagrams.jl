_zero_scale_error = "Rescaling by 0 forbidden"

"""
    scalex!(h::HasseDiagram, μ::Real=1.0)

Multiply all `x`-coordinates in `h`'s embedding by μ.
"""
function scalex!(h::HasseDiagram, μ::Real=1.0)
    if μ == 0
        throw(ArgumentError(_zero_scale_error))
    end

    for v in 1:nv(h.p)
        vec = h.xy[v]
        vec[1] *= μ
        h.xy[v] = vec
    end
    return nothing
end

"""
    scaley!(h::HasseDiagram, μ::Real=1.0)

Multiply all `y`-coordinates in `h`'s embedding by μ.
"""
function scaley!(h::HasseDiagram, μ::Real=1.0)
    if μ == 0
        throw(ArgumentError(_zero_scale_error))
    end

    for v in 1:nv(h.p)
        vec = h.xy[v]
        vec[2] *= μ
        h.xy[v] = vec
    end
    return nothing
end

"""
    scale!(h::HasseDiagram, μ::Real=1.0)

Multiply all coordinates in `h`'s embedding by μ. 
The resulting image won't look different. 
"""
function scale!(h::HasseDiagram, μ::Real=1.0)
    @warn "The scale! function is useless. Will be removed."
    scalex!(h, μ)
    scaley!(h, μ)
    return nothing
end
