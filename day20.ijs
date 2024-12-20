data =: ,[;._1 LF,CR-.~1!:1<'day20.txt'
size =: %:#data
distfn =:  {{
  if. 'E' = x{data do.
    y return.
  end.
  next_xs =: x+,(1,size)*/1 _1
  next_x_idx =: 1 i.~(_=next_xs{y)*(next_xs{data)e.'E.'
  next_x =: next_x_idx{next_xs
  next_x distfn (>:x{y)next_x}y
}} 

dist =: (size,size)$(data i.'S') distfn 0 (data i.'S')}_#~#data
sub =: -`2:@.(_=+)
vert =: |2-~((2}.]) sub"0 (_2}.]))dist
horiz =: vert =: |2-~((2}.]) sub"0 (_2}.]))|:dist