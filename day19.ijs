data =: <;._1 LF,CR-.~1!:1<'day19.txt'
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

solve_1 =: {{ {. y can_combine 0$0 }}

result_1 =: +/ > solve_1 &.> targets
