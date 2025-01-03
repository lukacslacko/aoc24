data =: <;._1 LF,CR-.~1!:1<'day19_apa.txt'
'input targets' =: <;._1 a:,data
patterns =: <;._1 ',',' '-.~{.>input

can_combine =: {{
  target =: x
  known =: y
  if. (#known) = #target do.
    known return.
  end.
  suffix =: (->:#known){.target
  cando =: 0
  for_pattern. patterns do.
    pat =: >pattern
    if. pat-:suffix do.
      cando =: 1
    else.
      if. pat-:suffix{.~#pat do.
        cando =: cando +. (<:#pat){known
      end.
    end.   
  end.
  target can_combine cando,known
}}

ways_to_combine =: {{
  target =: x
  known =: y
  if. (#known) = #target do.
    known return.
  end.
  suffix =: (->:#known){.target
  cando =: x:0
  for_pattern. patterns do.
    pat =: >pattern
    if. pat-:suffix do.
      cando =: cando + x:1
    else.
      if. pat-:suffix{.~#pat do.
        cando =: cando + (<:#pat){known
      end.
    end.   
  end.
  target ways_to_combine cando,known
}}

solve_1 =: {{ {. y can_combine 0$0 }}

result_1 =: +/ > solve_1 &.> targets

solve_2 =: {{ {. y ways_to_combine 0$0 }}

result_2 =: +/ > solve_2 &.> targets
