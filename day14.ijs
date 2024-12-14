num =: {{ ". (y='-')} y,: '_'$~$y }}
csv =: {{ num ;._1 ',',y }}
process_line =: {{
  'pos vel' =. (2}.]) ;._1 ' ',y
  (csv pos),: csv vel
}}
shape =: 101 103
filename =: 'day14_apa.txt'

data =: process_line ;._1 LF,CR-.~1!:1<filename
make_pts =: {{ shape | |: (+/ @ ((1, y)&*))"2 data }}
pts =: make_pts 100
quads =: (|:#~[:*/|) * pts - <.-:shape
result_1 =: */ +/"1 =quads

horizontality =: {{ >./+/({:y)=/i.{:shape }}
verticality =: {{ >./+/({.y)=/i.{.shape }}

h_max =: >./(horizontality@make_pts)"0 i.10000
h =: I.h_max=(horizontality@make_pts)"0 i.10000
v_max =: >./(verticality@make_pts)"0 i.10000
v =: I.v_max=(verticality@make_pts)"0 i.10000
result_2 =: h-.h-.v

easter_egg =: |: {{ '#'(<"1|:y)} shape $'.' }} make_pts result_2
