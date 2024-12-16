data =: [;._1 LF,CR-.~1!:1<'day16_apa.txt'

size =: #data

distances =: _#~4**/$data

pos =: {{
  'dir row col' =. y
  dir+4*col+size*row
}}

filter =: 4#,data

costs =: {{
  next =. y
  backwards =. x
  dir =. 4|next
  base =. next - dir
  others =. (base + dir -.~ i.4), next + backwards*4*dir{1, (-size), _1, size
  |:(|:others,:((3#1000), 1)) #~ '#'~:others{filter
}}

run_2 =: {{
  edge =. ,:y
  backwards =. x
  distances =. 0 y}_#~#filter  
  while. 0<#edge do.
    edge =. edge /: edge { distances
    next =. {. edge
    edge =. }. edge
    'pts cost' =. backwards costs next
    newdist =. cost + next { distances
    current_dists =. pts { distances
    edge =. edge, (newdist < current_dists) # pts
    distances =. (newdist <. current_dists) pts}distances
  end.
  distances
}}

dists_from_s =: 1 run_2 pos 0, (size-2), 1

result_1 =: <./ (filter='E') # dists_from_s

arrived_at_e =: {.I.(filter='E') * dists_from_s = result_1

dists_from_e =: _1 run_2 arrived_at_e

result_2 =: #~.(]-4|])I.(=<./)dists_from_e+dists_from_s
