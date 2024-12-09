data =: "."0 LF-.~CR-.~1!:1 < 'day9_apa.txt'
num =: >.-:#data
ids =: }:;</.(i.num),.num#_
layout =: ;(<@#/)"1 data,.ids

drop_last_free =: }: ^: (_={:) ^: _
move_last_forward =: }: @: ({: (] i.&_)} ])
compact_step =: move_last_forward^:(_&e.) @: drop_last_free
NB. compactified =: compact_step^:_ layout
NB. checksum =: +/ */"1 (,.(i.@#)) x:compactified

NB. x = file id, y = current layout
gap_start =: {{ 1 i.~ (_ #~ y=x) E. y }}

NB. x = file id, y = current_layout
move_file =: {{ x ((x gap_start y) + i. +/ x=y)} _ (I. x=y)} y }}

NB. x = file id, y = current layout
handle_file =: {{
  echo x
  result =. y
  if. (x gap_start y) < y i. x do.
    result =. x move_file y
  end.
  result
}}

compact_2 =: layout ] F.: handle_file i.num
result_2 =: +/ */"1 (,.(i.@#)) x: 0 (I.compact_2=_)} compact_2