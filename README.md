# HasseDiagrams

Drawings of partially ordered sets. 

## Basic Usage

```
julia> p = subset_lattice(3)
{8, 19} Int64 poset

julia> h = HasseDiagram(p)
Hasse diagram of a {8, 19} Int64 poset

julia> draw(h)
```