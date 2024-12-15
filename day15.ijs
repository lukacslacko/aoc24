data =: <;._1 LF,CR-.~1!:1<'day15_apa.txt'
parts =: <;._1 a:,data
map =: >>{.parts
moves =: ' '-.~,>>{:parts

move_row_left =: {{
  row =. y
  robot =. 1 + row i.'@'
  prefix =. robot {. row
  if. -.'.'e.prefix do.
    row return.
  end.
  last_dot =. prefix i: '.'
  to_move =. last_dot}.prefix
  if. '#' e. to_move do.
    row return.
  end.
  (last_dot {. prefix), (1|. last_dot}. prefix), robot}.row
}}

move_left =: {{
  row_index =. {.I.('@'e.])"1 y
  (move_row_left row_index{y) row_index} y
}}

mirror_rows =: |."1

move =: {{
  dir =. x
  choice =. '<>^v'i.dir
  action =: (]`mirror_rows`|:`(mirror_rows@:|:))@.choice
  (move_left &.: action) y
}}

test =: '...','.@.',:'...'

moved =: map < F:. move moves
steps =: |:(>map;moved);"2 0 moves,' '

last_move =: >{:moved

coords =: ,{;~i.#map
score =: {{
  ('O'=y{last_move) * +/100 1*>y
}}
result_1 =: +/ score"0 coords