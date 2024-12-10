data =: "."0 ;._1 LF,CR-.~1!:1 < 'day10.txt'

state =: 9=data

leftright =: [: +/ ((1 _1)&(|.!.0"0 _))
neighbors =: leftright + leftright &. |:

NB. height step state
step =: {{ (x=data) * neighbors y}}

