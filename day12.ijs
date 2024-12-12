data =: [;._1 LF,CR-.~1!:1 < 'day12_apa.txt'
num =: #data
square =: (num,num)&$

neighbors =: (+./@((i:1)&(|.!.0"0 _))){{u+.u&.|:}}

find_region =: {{
  start =. 0 i.~'.'=,y
  field =. y = start { ,y
  mask =. square 1 (start }) ,square 0
  ([:field&*neighbors)^:_ mask
}}

split_region =: {{
  letters =. >{:y
  region =. find_region letters
  (region;>{.y);(region}letters,:square '.')
}}
 
regions =: }:>>{.split_region^:{{-.*./'.'=,>{:y}}^:_. a:;data

fence =: {{
  +/ (0,y)~:(y,0)
}}

score =: {{
  area =. +/,y
  circum =. (+/ fence"1 y) + +/ fence"1 |:y
  area*circum
}}

result_1 =: +/ score"2 regions

fence_pieces =: {{
  {{(0,y)~:y,0}}"1 y
}}

count_vertical_pieces =: {{
  -: +/ fence"1 |: fence_pieces y
}}

count_diagonals =: {{
  +/ (9 6)e.~ (#."1) _ 4 $ ,2]\"2 (|:"2) 2]\y
}}

count_pieces =: {{
  (2 * count_diagonals y) + (count_vertical_pieces y) + count_vertical_pieces |:y
}}

score_by_pieces =: {{
  (+/,y) * count_pieces y
}}

result_2 =: +/ score_by_pieces"2 regions