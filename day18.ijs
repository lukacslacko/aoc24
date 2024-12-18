data =: ".;._1 LF,CR-.~1!:1<'day18.txt'
size =: 71

can_get_out =: {{
  bad =: +/"1(1,size)*"1>y{. data
  good =: bad-.~i.*:size
  ready =: 0$0
  ready_dist =: 0$0
  just =: 1$0
  dist =: 1$0
  target =: <:*:size

  show =: {{
    for_line. i.size do.
      echo (((i.size)+size*line) e. y) } (size#'.'),:size#'#'
    end.
  }}

  numbers =: {{
    for_line. i.size do.
      ns =: (i.size)+size*line
      idxs =: ready i."_ 0 ns
      echo ": idxs { (ready_dist, _)
    end.
  }}

  {{
    while. 0<#just do.
      current =: {.just
      if. current=target do.
        {.dist return.
      end.
      dirs =: size*1 _1
      if. 0<size|current do.
        dirs =: dirs, _1
      end.
      if. (<:size)>size|current do.
        dirs =: dirs, 1
      end.
      ns =: (just, ready) -.~ good -. good-. current + dirs
      ready =: ready, current
      ready_dist =: ready_dist, {.dist
      just =: (}.just), ns
      dist =: (}.dist), (>:{.dist)#~#ns
    end.
    _
  }} _
}}

result_1 =: can_get_out 1024
echo can_get_out 2929
echo can_get_out 2930
echo {:2930{.data
