rule_applies =: (e.~ {.) *. (e.~ }.)
well_ordered =: (i. {.) <: (i. }.)
rule_matches =: well_ordered +. -.@rule_applies
good_update =: {{ .* y rule_matches"1 rules }}
good_updates =: good_update updates
middle_item =: {~ (<. @ -: @ #)
result_1 =: +/ middle_item"1 good_updates