var documenterSearchIndex = {"docs":
[{"location":"#HasseDiagrams","page":"HasseDiagrams","title":"HasseDiagrams","text":"","category":"section"},{"location":"","page":"HasseDiagrams","title":"HasseDiagrams","text":"Drawings of Posets (partially ordered sets).","category":"page"},{"location":"#Basic-Usage","page":"HasseDiagrams","title":"Basic Usage","text":"","category":"section"},{"location":"","page":"HasseDiagrams","title":"HasseDiagrams","text":"To create a Hasse diagram for a Poset and draw it on the screen, do this:","category":"page"},{"location":"","page":"HasseDiagrams","title":"HasseDiagrams","text":"julia> using Posets, HasseDiagrams\n\njulia> p = subset_lattice(3)\n{8, 19} Int64 poset\n\njulia> h = HasseDiagram(p)\nHasse diagram of a {8, 19} Int64 poset\n\njulia> draw(h)","category":"page"},{"location":"","page":"HasseDiagrams","title":"HasseDiagrams","text":"Note that h contains a copy of p, so subsequent changes to p are not reflected in h.","category":"page"},{"location":"#Creating-a-Layout","page":"HasseDiagrams","title":"Creating a Layout","text":"","category":"section"},{"location":"","page":"HasseDiagrams","title":"HasseDiagrams","text":"When a Hasse diagram is created, it is given a default layout. Hasse diagrams can be given an alternative layout with the function set_xy!. There are two forms:","category":"page"},{"location":"","page":"HasseDiagrams","title":"HasseDiagrams","text":"set_xy!(h, method) uses the function method to compute the layout. The function acts on the posets held inside h. The list of available layout methods is in the next section. \nset_xy!(h, xy) uses the dictionary xy to site the vertices. Vertex v is placed at xy[v]. If v is not a key of xy, then its location is unchanged.","category":"page"},{"location":"#Scaling","page":"HasseDiagrams","title":"Scaling","text":"","category":"section"},{"location":"","page":"HasseDiagrams","title":"HasseDiagrams","text":"The function scale!(p,μ) multiplies all coordinates in the embedding by μ.  It is likely more useful just to multiply the x- or y-coordinates;  to do so, use scalex! or scaley!, respecitvely. ","category":"page"},{"location":"#Layout-Methods","page":"HasseDiagrams","title":"Layout Methods","text":"","category":"section"},{"location":"","page":"HasseDiagrams","title":"HasseDiagrams","text":"basic_layout places vertices vertically based on their rank and, within each rank, the horizontal placement is evenly spaced.\ndim2_layout is a decent layout function that is applicable to posets whose dimension is at most two. Reasonbly quick. If the poset has dimension greater than two, a reasonable alternative is presented. \nlayered_layout is a Sugiyaqma style layout from the LayeredLayouts module. Can be slow. ","category":"page"},{"location":"#Sample-Results","page":"HasseDiagrams","title":"Sample Results","text":"","category":"section"},{"location":"","page":"HasseDiagrams","title":"HasseDiagrams","text":"Results for a randomly generated two-dimensional poset:","category":"page"},{"location":"","page":"HasseDiagrams","title":"HasseDiagrams","text":"(Image: )","category":"page"},{"location":"","page":"HasseDiagrams","title":"HasseDiagrams","text":"(Image: )","category":"page"},{"location":"","page":"HasseDiagrams","title":"HasseDiagrams","text":"(Image: )","category":"page"},{"location":"#Properties","page":"HasseDiagrams","title":"Properties","text":"","category":"section"},{"location":"#Font-size","page":"HasseDiagrams","title":"Font size","text":"","category":"section"},{"location":"","page":"HasseDiagrams","title":"HasseDiagrams","text":"Use set_font_size!(h, sz) to set labels to be sz points. Use 0 to hide labels. Default is FONT_SIZE = 10.\nUse get_font_size(h) to determine the current font size for h. ","category":"page"},{"location":"#Node-radius","page":"HasseDiagrams","title":"Node radius","text":"","category":"section"},{"location":"","page":"HasseDiagrams","title":"HasseDiagrams","text":"Use set_radius!(h, r) to set the size of the circles that represent the elements of the poset. Default is RADIUS = 12.\nUse get_radius(h) to determine the current radius.","category":"page"},{"location":"#Fill-color","page":"HasseDiagrams","title":"Fill color","text":"","category":"section"},{"location":"","page":"HasseDiagrams","title":"HasseDiagrams","text":"Use set_fill_color!(h, c) to set the fill color for the circles to c. Default is FILL_COLOR = :white. All circles are filled with the same color. \nUse get_fill_color(h) to determine the current color. ","category":"page"},{"location":"#Example","page":"HasseDiagrams","title":"Example","text":"","category":"section"},{"location":"","page":"HasseDiagrams","title":"HasseDiagrams","text":"Here is an example for drawing (small) subset lattices with sensible labels. Here is the function to produce the picture:","category":"page"},{"location":"","page":"HasseDiagrams","title":"HasseDiagrams","text":"using Posets, HasseDiagrams, SimpleDrawing, ShowSet\n\nfunction draw_bool(k)\n    p = subset_lattice(k)\n    h = HasseDiagram(p)\n    labs = Dict{Int,String}()\n    for v in 1:nv(p)\n        labs[v] = string(subset_decode(v))\n    end\n    set_labels!(h, labs)\n    set_font_size!(h, 8)\n    set_radius!(h, 30)\n    set_fill_color!(h, :lightblue)\n    set_xy!(h, layered_layout)\n    draw(h)\n    expand_canvas()  # from SimpleDrawing\nend","category":"page"},{"location":"","page":"HasseDiagrams","title":"HasseDiagrams","text":"Here is the result of draw_bool(4):","category":"page"},{"location":"","page":"HasseDiagrams","title":"HasseDiagrams","text":"(Image: )","category":"page"}]
}
