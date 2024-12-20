data =: ,[;._1 LF,CR-.~1!:1<'day20_apa.txt'
size =: %:#data

dfn =: {{
  max =: >./y
  pos =: y i.max
  if. 'E' = pos{data do.
    y return.
  end.
  next_pos =: pos+,(1,size)*/1 _1
  good_idx =: 1 i.~(0>next_pos{y)*(next_pos{data)e.'E.'
  next_pos =: good_idx{next_pos
  (>:max) next_pos}y
}}

dist =: (size,size)$(dfn^:_) 0 (data i.'S')}__#~#data

sub =: -`2:@.(__=+)
vert =: 2-~|(2}.dist)sub"0(_2}.dist)
horiz =: 2-~|(2}.|:dist)sub"0(_2}.|:dist)
result_1 =: +/100<:,vert,horiz

diamond =: {{ 
  center =: x
  radius =: y
  result =: 0$0
  row =: <.center%size
  col =: size|center
  for_r. i:radius do.
    this_row =: row + r
    if. -. this_row e.i.size do.
      continue.
    end.
    dc =: radius - |r
    c1 =: col + dc
    c2 =: col - dc
    if. c1 e.i.size do.
      result =: result, c1+this_row*size
    end.
    if. c2 e.i.size do.
      result =: result, c2+this_row*size
    end.
  end.
  ~.result
}}
keep_good =: (i.#data)-.(i.#data)-.]

make_cheats =: {{
  center =: y
  radius =: x
  current =. center{,dist
  if. 0>current do.
    0$0 return.
  end.
  scores =. (current+radius)-~(center diamond radius){,dist
  (#~ 0&<) scores
}}

cheats =: 0-.~,(i.20) (make_cheats"0/) i.#data
