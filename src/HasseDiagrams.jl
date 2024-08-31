module HasseDiagrams

using Posets
using SimpleDrawing

export HasseDiagram

struct HasseDiagram
    p::Poset
    xy::Dict{Int,Vector{Float64}}
    radius::Real
    fill_color::Symbol

    labels::Dict{Int,Any}
    label_size::Int

    function HasseDiagram(p::Poset)
        n = nv(p)
        xy = Dict{Int,Vector{Float64}}()
        radius = 12
        fill_color = :white

        labels = Dict{Int,Any}()
        for v in 1:n
            labels[v] = v
        end
        label_size = 0

        return new(p, xy, radius, fill_color, labels, label_size)
    end
end

end # module HasseDiagrams
