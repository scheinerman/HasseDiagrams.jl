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

* `set_xy(h, method)` uses the function `method` to compute the layout. The function acts on the posets held inside `h`.
* `set_xy(h, xy)` uses the dictionary `xy` to site the vertices. Vertex `v` is placed at `xy[v]`. If `v` is not a key of `xy`, then its location is unchanged.

## Layout Methods

At this instant, we only have `basic_layout`. 


## Properties

### Font size

* Use `set_font_size(h, sz)` to set labels to be `sz` points. Use `0` to hide labels. 
* Use `get_font_size(h)` to determine the current font size for `h`. 

