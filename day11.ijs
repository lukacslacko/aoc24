data =: 6571 0 5851763 526746 23 69822 9 989

state =: ;/1,.data

change =: {{
  freq =. {.y
  stone =. {:y
  if. stone = 0 do.
    freq, 1 return.
  end.
  digits =. 10 (#.^:_1) stone
  if. 2 | #digits do.
    freq, stone * 2024 return.
  end.
  freq&,&.> (-:#digits) ((10#.{.);10#.}.) digits  
}}

step =: {{ ;/ ]S:0 change &.> y }}

aggregate =: {{ 
  items =. {:"1>y
  counts =. {."1>y
  ;/ items ((+/@]),[) /.. counts 
}}

iter =: aggregate @ step

result_1 =: +/ {."1 > iter^:25 state
result_2 =: +/ {."1 > iter^:75 state
