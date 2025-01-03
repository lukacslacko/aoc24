data =: <;._1 LF, (#~ CR&~:) 1!:1 < 'day5_apa.txt'
parts =: <;._1 (<''),data
rule_lines =: >0{parts
update_lines =: >1{parts
line_to_update =: [: ". ;._1 ','&,
updates =: line_to_update &.> update_lines
line_to_rule =: [: ". ;._1 '|'&,
rules =: > line_to_rule &.> rule_lines
rule_applies =: (e.~ {.) *. (e.~ {:)
well_ordered =: (i. {.) <: (i. {:)
rule_matches =: well_ordered +. -.@rule_applies
good_update =: {{ *./ y rule_matches"1 rules }}
middle_item =: {~ (<. @ -: @ #)
result_1 =: +/ > middle_item &.> (> good_update &.> updates) # updates

bad_updates =: (-. > good_update &.> updates) # updates
matching_half_rules =: {{ {."1 (#~ y&rule_applies"1) rules }}
nth_most_common =: {{ (~.y) {~ (+/"1 ~.y =/ y) i. x }}
fixed_middle_item =: {{ (<. -: # y) nth_most_common matching_half_rules y }}
result_2 =: +/ > fixed_middle_item &.> bad_updates