d=:".;._1 LF,CR-.~1!:1<'day22.txt'
s=:(<:*/8#8)17 b.](22 b.)33 b.
n=:11 s _5 s 6 s ]
p=:10|n^:(>:i.2000) d

k=:[:+/(20^i.4)*10+}:-}.

keys =: |:5 k\p
values =: |:0,~4}.p
gain =: {{ 
  row =. x
  key =. y
  ((row{keys) i. key) { row { values 
}}"0
total_gain =: {{ 
  if. 0=100|y do.
    echo y; #all_keys
  end.
  +/ (i.#keys) gain y{all_keys 
}}"0

echo +/n^:2000 d
NB. 4185 too high
all_keys =: ~.,keys
echo >./total_gain i.#all_keys