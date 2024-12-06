data =: (#~0<#@>) <;._1 LF,(1!:1 < 'day6_apa.txt')-.CR
n =: #data
input =: ,>data
dir =: -.&'X.#'
pos =: i.dir

next_state =: {{
  N =. 'n'~
  prev_state =. ;{:y
  d =. >0{prev_state
  p =. >1{prev_state
  r =. <.p%N
  c =. p - r*N
  stays_on_board =. -.+./ ((d='<')*.c=0), ((d='>')*.c=N-1), ((d='^')*.r=0), ((d='v')*.r=N-1)  
  if. stays_on_board *. -. ({:y) e. }:y do.
    next_pos =. p + (_1, 1, (-N), N) {~ '<>^v' i. d
    if. '#' = next_pos { x do.
      result =. y, < ('^v><' {~ '<>^v' i. d) ; p
    else.
      result =. y, < d ; next_pos
    end. 
  else.
    result =. y
  end.
  result
}}
  
initial_state =: < (dir input); pos input
states =: input next_state^:_ initial_state
visited_positions =: , ~. > {:"1 > states
result_1 =: # visited_positions

visited_empty_positions =: visited_positions #~ '.' = visited_positions { input

loopy =: {{
  field =. '#' y}x
  states =. field next_state^:_ initial_state
  result =. ({: states) e. }: states
  result
}}

calc_2 =: {{
  result =. 0
  for_ijk. visited_empty_positions do.
    if. input loopy ijk do.
      result =. result + 1
    end.
    echo (#visited_empty_positions), ijk_index, result, ijk
  end.
  result
}}

result_2 =: calc_2 _
