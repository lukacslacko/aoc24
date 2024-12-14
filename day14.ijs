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
pts =: (width, height) | |: (+/ @ ((1, steps)&*))"2 data
quads =: (|:#~[:*/|) * ((<.-:width), <.-:height) - pts
result_1 =: */ +/"1 =quads
