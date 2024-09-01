function dim2_layout(p::Poset, list1::Vector, list2::Vector)
    n = nv(p)
    xy = Dict{Int,Vector{Float64}}()

    x = sortperm(list1)
    y = sortperm(list2)

    rot = [1 -1; 1 1]
    XY = [x y] * rot'

    for v in 1:n
        xy[v] = XY[v, :]
    end
    return xy
end

"""
    dim2_layout(p::Poset)

Create a layout for a two-dimensional poset using its realizer.
"""
function dim2_layout(p::Poset)
    try
        R = realizer(p, 2)
        list1 = Posets._chain2list(R[1])
        list2 = Posets._chain2list(R[2])
        return dim2_layout(p, list1, list2)
    catch
        throw(ArgumentError("This poset's dimension is greater than two."))
    end
end
