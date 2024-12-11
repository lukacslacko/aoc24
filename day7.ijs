data =: (#~0<#@>) <;._1 LF,CR-.~1!:1<'day7.txt'

process_row =: {{
  'target nums' =. <;._1 ':',y
  expected =. ".target
  input =. }.;' '&,&.>|.<;._1 nums NB. reverse order of numbers
  spaces =. I. ' ' = input
  choices =. (#&2 #: [: i. 2:^]) # spaces
  ops =. choices { '+*'
  exprs =. (spaces}&input)"1 ops
  values =. ".exprs
  NB. echo expected; (expected e. values); ((,.values); exprs)
  expected * expected e. values
}}

result_1 =: +/ > process_row &> data

result_1_short=:+/>{{
't i'=:".&.><;._1':',y
t*t e.{{(y{+`*)/|.i}}"1(#&2#:[:i.2:^])<:#i
}}&>data

process_row_2_not_so_short =: {{
  'target input' =: ".&.><;._1 ':',y
  choices =. (#&3 #: [: i. 3:^]) <: # input
  combine_numbers =: {{ ". (":y), ":x }}
  apply_choice =. {{ (y { +`*`combine_numbers)/ |. input }}
  target * target e. apply_choice"1 choices
}}

result_2=:+/>{{
't i'=:".&.><;._1':',y
t*t e.{{(y{+`*`{{".(":y),":x}})/|.i}}"1(#&3#:[:i.3:^])<:#i
}}&><;._1 LF,CR-.~1!:1<'day7.txt'