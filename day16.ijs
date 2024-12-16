data =: [;._1 LF,CR-.~1!:1<'day16_apa.txt'

start_row =: {.I.'S'e."1 data
start_col =: 'S'i.~start_row{data

steps =: {{
  'score dir row col' =: y
  other_dirs =. dir -.~ i.4
  result =. {{ (1000+score), y, row, col }}"0 other_dirs
  'new_row new_col' =. (row, col) + dir { 1 0, 0 1, _1 0,: 0 _1
  if. '#' ~: (<new_row, new_col){data do.
    result =. result, ((>:score), dir, new_row, new_col)
  end.
  result
}}

reached =: ,: 0, 0, start_row, start_col
reachable =: 0 4$0

run =: {{
  reachable =: steps {: reached
  while. 1 do.
    reachable =: /:~ reachable
    consider =. {. reachable
    reachable =: }. reachable
    field =. (<(2{consider), 3{consider){data
    if. field = 'E' do.
      0{consider return.
    end.
    if. field = '#' do.
      continue.
    end.
    reached =: reached, consider
    if. 0 = 10000|#reached do.
      echo #reached
    end.
    next_ones =. steps {: reached
    already_there =: (}."1 next_ones) e. (}."1 reached, reachable)
    reachable =: reachable, (-.already_there) # next_ones
  end.
}}

result_1 =: run _