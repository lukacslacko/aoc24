num =: {{
  ". (y='-')} y,: '_'#~#y
}}

csv =: {{
  'a b' =. ];._1 ',',y
  (num a), num b
}}

process_line =: {{
  'pos vel' =. (2}.]) ;._1 ' ',y
  (csv pos),: csv vel
}}

steps =: 100
width =: 101
height =: 103
filename =: 'day14_apa.txt'

data =: process_line ;._1 LF,CR-.~1!:1<filename
make_pts =: {{
  (width, height) | |: (+/ @ ((1, y)&*))"2 data
}}
pts =: make_pts steps
quads =: (|:#~[:*/|) * ((<.-:width), <.-:height) - pts
result_1 =: */ +/"1 =quads

NB. horizontality make_pts steps
horizontality =: {{
  >./+/({:y)=/i.height
}}

verticality =: {{
  >./+/({.y)=/i.width
}}

render =: {{
  '#'(<"1|:y)}(width, height)$'.'
}}

h_max =: >./(horizontality@make_pts)"0 i.10000
h =: I.h_max=(horizontality@make_pts)"0 i.10000
v_max =: >./(verticality@make_pts)"0 i.10000
v =: I.v_max=(verticality@make_pts)"0 i.10000
result_2 =: h-.h-.v
