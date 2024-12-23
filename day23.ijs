data =: ((2 _2){."0 1/]);._1 LF,CR-.~1!:1<'day23.txt'
edges =: ([:+/1 256*a.i.])"1 data
bidir =: edges,(|.)"1 edges
verts =: ~.,edges
t_verts =: verts#~116=256|verts
neigh =: {{ {:"1 bidir #~ (y={.)"1 bidir}}
tri =: {{(/:~)"1 y,.edges-.edges-._ 2$,,"0/~neigh y}}
echo #(0 0 0)-.~~._ 3$,tri"0 t_verts
num_edges =: {{#edges-.edges-._ 2$,,"0/~y}}
click =: verts #~ 66=num_edges"1 neigh"0 verts
str =: {{ (a.{~256|y),a.{~<.y%256 }}
echo }.,',',./:~str"0 click