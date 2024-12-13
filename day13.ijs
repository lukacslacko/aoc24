data =: <;._1 LF, (#~ CR&~:) 1!:1 < 'day13_apa.txt'
parts =: [;._1 (<''),data
numbers =: [:".]#~e.&(":i.10)
input =: >numbers&.>parts
solve =: {{ ({:y) %. |: (}:y) }}
ints =: *./@(=<.)
cost =: {{ (ints y) * +/ 3 1 * y }}
result_1 =: +/ cost"1 solve"2 input

solve_2 =: {{ (10000000000000+{:y) %. |: (}:y) }}
result_2 =: +/ cost"1 solve_2"2 x:input

r=:+/((*./@(=<.))*[:+/3 1*])@({:%.|:@}:)"2>_ 3 2$".(1!:1<'day13.txt')-.a.-.":i.10
