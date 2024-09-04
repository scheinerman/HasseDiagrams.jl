using Test
using Posets, HasseDiagrams


p = chain(1) / (chain(2) + chain(1)) / chain(2)
h = HasseDiagram(p)
set_xy!(h, layered_layout)
coords = values(get_xy(h))
ys = [ v[2] for v in coords ]

@test maximum(ys) == height(p)