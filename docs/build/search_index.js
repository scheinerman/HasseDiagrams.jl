var documenterSearchIndex = {"docs":
[{"location":"#HasseDiagrams","page":"HasseDiagrams","title":"HasseDiagrams","text":"","category":"section"},{"location":"","page":"HasseDiagrams","title":"HasseDiagrams","text":"Drawings of partially ordered sets. ","category":"page"},{"location":"#Basic-Usage","page":"HasseDiagrams","title":"Basic Usage","text":"","category":"section"},{"location":"","page":"HasseDiagrams","title":"HasseDiagrams","text":"julia> p = subset_lattice(3)\n{8, 19} Int64 poset\n\njulia> h = HasseDiagram(p)\nHasse diagram of a {8, 19} Int64 poset\n\njulia> draw(h)","category":"page"},{"location":"#Creating-a-Layout","page":"HasseDiagrams","title":"Creating a Layout","text":"","category":"section"},{"location":"","page":"HasseDiagrams","title":"HasseDiagrams","text":"When a Hasse diagram is created, it is given a default layout. Hasse diagrams can be given an alternative layout with the function set_xy. There are two forms:","category":"page"},{"location":"","page":"HasseDiagrams","title":"HasseDiagrams","text":"set_xy(h, method) uses the function method to compute the layout. The function acts on the posets held inside h.\nset_xy(h, xy) uses the dictionary xy to site the vertices. Vertex v is placed at xy[v]. If v is not a key of xy, then its location is unchanged.","category":"page"},{"location":"#Layout-Methods","page":"HasseDiagrams","title":"Layout Methods","text":"","category":"section"},{"location":"","page":"HasseDiagrams","title":"HasseDiagrams","text":"At this instant, we only have basic_layout. ","category":"page"},{"location":"#Properties","page":"HasseDiagrams","title":"Properties","text":"","category":"section"},{"location":"#Font-size","page":"HasseDiagrams","title":"Font size","text":"","category":"section"},{"location":"","page":"HasseDiagrams","title":"HasseDiagrams","text":"Use set_font_size(h, sz) to set labels to be sz points. Use 0 to hide labels. \nUse get_font_size(h) to determine the current font size for h. ","category":"page"}]
}
