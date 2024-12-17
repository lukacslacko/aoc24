PROG =: 2,4,1,3,7,5,1,5,0,3,4,3,5,5,3,0

full_run =: {{
'A B C' =: y, 0, 0

IP =: 0
OUT =: 0$0

combo =: {{ y { (i.4),A,B,C }}

adv =: {{ A =: <. A % 2 ^ combo y }}
bxl =: {{ B =: B (22 b.) y }}
bst =: {{ B =: 8 | combo y }}
jnz =: {{ IP =: (*A) { IP, y }}
bxc =: {{ B =: B (22 b.) C }}
out =: {{ OUT =: OUT, 8 | combo y }}
bdv =: {{ B =: <. A % 2 ^ combo y }}
cdv =: {{ C =: <. A % 2 ^ combo y }}

step =: {{
  op =: PROG{~IP
  nd =: PROG{~>:IP
  NB. echo IP;(op,:nd);(A,B,:C)
  IP =: IP + 2
  adv`bxl`bst`jnz`bxc`out`bdv`cdv @. op nd
}}

step^:{{ IP < #PROG }}^:_. (_)
OUT
}}

pre =: {{
  outs =: full_run"0 y+i.8
  len =: #{.outs
  expected =: (len&{.)&.|.PROG
  I. outs -:"1 expected
}}


echo (',' (I.@(' '=])) } ] )": full_run 47006051
