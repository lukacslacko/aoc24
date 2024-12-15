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

widechar =: {{
  select. y
    case. '#' do.
      '##'
    case. 'O' do.
      '[]'
    case. '.' do.
      '..'
    case. '@' do.
      '@.'
  end.
}}

widerow =: {{ ,/ widechar"0 y }}
widemap =: widerow"1 map

wide_up =: {{
  row_to_move =. {.I.('@'e.])"1 y
  cols_to_move =. I.'@'=row_to_move{y
  coords_to_move =. (row_to_move,])"0 cols_to_move
  while. 1 do.
    row_to_move =. <:row_to_move
    current_row =. row_to_move{y
    if. '#' e. cols_to_move{current_row do.
      y return.
    end.
    new_cols_to_move =. 0#_
    for_col. cols_to_move do.
      letter =. col{current_row
      select. letter
        case. '[' do.
          new_cols_to_move =. new_cols_to_move, col, col+1
        case. ']' do.
          new_cols_to_move =. new_cols_to_move, col, col-1
      end.
    end.
    if. 0=#new_cols_to_move do.
      break.
    end.
    cols_to_move =. ~.new_cols_to_move
    coords_to_move =. coords_to_move, (row_to_move,])"0 cols_to_move
  end.
  result =. y
  for_coord. |.coords_to_move do.
    above =. <(coord - 1 0)
    result =. ((<coord){result) above}result
    result =. '.' (<coord)}result
  end.
  result
}}

widemove =: {{
  dir =. x
  choice =. '<>^v'i.dir
  action =: (move_left`(move_left &.: mirror_rows)`wide_up`(wide_up &.: |.))@.choice
  action y
}}

widemoved =: widemap ] F.. widemove moves

widecoords =: ,{(i.#map);(i.+:#map)
widescore =: {{
  ('['=y{widemoved) * +/100 1*>y
}}
result_2 =: +/ widescore"0 widecoords
