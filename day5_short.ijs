p=:<;._1(<''),<;._1 LF,CR-.~1!:1<'day5.txt'
i=:([:".;._1','&,)&.>>1{p
r=:>([:".;._1'|'&,)&.>>0{p
a=:(e.~{.)*.(e.~{:)
g=:[:*./((-.@a)+.((i.{.)<:(i.{:)))"1&r
result_1 =: +/>({~(<.@-:@#))&.>(>g&.>i)#i

h =: r#~a"1&r

matching_half_rules =: {{ {."1 (#~ y&a"1) r }}
nth_most_common =: {{ (~.y) {~ (+/"1 ~.y =/ y) i. x }}
fixed_middle_item =: {{ (<. -: # y) nth_most_common h y }}
result_2 =: +/ > fixed_middle_item &.> (-. > g &.> i) # i