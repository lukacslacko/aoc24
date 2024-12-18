NB. PROG =: 2,4,1,3,7,5,1,5,0,3,4,3,5,5,3,0
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

cnt =: 0
guesses =: 0$0

guess =: {{
  seq =: full_run y
  if. (#seq) = #PROG do.
    cnt =: >:cnt
    NB. echo y;seq;PROG;cnt
  end.
  if. seq -: PROG do.
    guesses =: guesses, y
    y return.
  end.
  if. (#seq) >: #PROG do.
    0 return.
  end.
  if. -. ((-#seq){.PROG) -: seq do.
    0 return.
  end.
  for_i. (8*y) + i:8 do.
    good =: guess i
  end.
  0 return.
}}

echo (',' (I.@(' '=])) } ] )": full_run 47111006051*8
guess x:6
echo /:~guesses