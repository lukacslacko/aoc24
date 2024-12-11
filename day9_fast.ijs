data =: "."0 LF-.~CR-.~1!:1 < 'day9.txt'
num =: >.-:#data
ids =: }:;</.(i.num),.num#_
state =: data,.ids

NB. file_id handle_file state
handle_file =: {{
  echo x
  file_id =. x
  state =. y
  file_pos =. file_id i.~ {:"1 state
  file_size =. {. file_pos { state
  first_fit =. 1 i.~ ((file_size <: {.) *. (_ = {:))"1 state 
  result =. state
  if. first_fit < file_pos do.
    gap_length =. {. first_fit { state
    result =. (first_fit {. state)
    result =. result, (file_pos { state)
    result =. result, ((gap_length - file_size), _)
    result =. result, ((>:first_fit) }. file_pos {. state)
    result =. result, (file_size, _) 
    result =. result, ((>:file_pos) }. state)
  end.
  result
}}

compacted =: state ] F.: handle_file i.num
NB. state (;@:((<@#/)"1)) F:: handle_file i.num
expanded =: (0:^:(_&=))"0;(<@#/)"1 compacted
result =: +/x:((i.@#)*])expanded
