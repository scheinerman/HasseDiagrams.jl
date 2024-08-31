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

## Creating a Layout

When a Hasse diagram is created, it is given a default layout. Hasse diagrams can be given an alternative layout with the function `set_xy`. There are two forms:

* `set_xy(h, method)` uses the function `method` to compute the layout. The function acts on the posets held inside `h`. The list of available layout methods is in the next section. 
* `set_xy(h, xy)` uses the dictionary `xy` to site the vertices. Vertex `v` is placed at `xy[v]`. If `v` is not a key of `xy`, then its location is unchanged.

## Layout Methods

* `basic_layout` places vertices vertically based on their rank and, within each rank, the horizontal placement is evenly spaced.
* `layout_2d` is a decent layout function but only applicable to posets whose dimension is at most two. 


## Properties

#### Font size

* Use `set_font_size(h, sz)` to set labels to be `sz` points. Use `0` to hide labels. 
* Use `get_font_size(h)` to determine the current font size for `h`. 

