data =: "."0 ;._1 LF,CR-.~1!:1 < 'day10.txt'

has_leftright =: [: +./ ((1 _1)&(|.!.0"0 _))
has_neighbor =: has_leftright +. has_leftright &. |:
peaks =: {{ ($data) $ 1 y} (#,data) # 0 }}"0 I.9=,data

NB. height step state
step =: {{ (x=data) *"2 has_neighbor"2 y}}

result_1 =: +/,, peaks ]F.: step i.9

state =: 9=data
sum_leftright =: [: +/ ((1 _1)&(|.!.0"0 _))
sum_neighbors =: sum_leftright + sum_leftright &. |:
sumstep =: {{ (x=data) * sum_neighbors y }}
result_2 =: +/, state ]F.: sumstep i.9

d=."."0;._1 LF,CR-.~1!:1<'day10.txt'
r=:+/(9=d),F.:((d=[)*[:([:+/(1 _1)&(|.!.0"0 _))1 :'u+u&.|:'])i.9