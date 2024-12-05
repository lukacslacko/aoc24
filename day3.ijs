data =: 1!:1 < 'day3_apa.txt'
suffixes =: ]\.data
good_start =: [: 'mul('&-: 4{. [
rest =: 4&}.
NB. first_closing =: [: {. [: I. ')'&=
first_closing =: {. @: (I. @: (')'&=))
arg =: (first_closing @ rest) {. rest
NB. args =: [: <;._1 ',1,'&,
args =: <;._1 @: (',1,'&,)
decode =: (". :: 0"_) &>
prod =: (*/) * ([: 3&= #)
NB. value =: good_start * ([: prod decode @ args @ arg)
value =: good_start * (prod @: decode @ args @ arg)
values =: value"1 suffixes
result_1 =: +/ values
is_do =: [: 'do()'&-: 4{. [
is_dont =: [: 'don''t()'&-: 7{. [
enable =: is_do"1 suffixes
disable =: is_dont"1 suffixes
input =: enable ,. disable ,. values
first_state =: 1 ,. 0  NB. enabled, sum of values
NB. next_enable =: (-.(1{[)) *. ((0{]) +. (0{[))
next_enable =: {{ (-.1{x) *. ((0{y) +. 0{x) }}
NB. next_sum =: (1{]) + (0{]) * (2{[)
next_sum =: {{ (1{y) + (0{y) * (2{x) }}
next_state =: next_enable ,. next_sum
result_2 =: first_state }. F.. next_state input