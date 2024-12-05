data =: 1!:1 <'day2_real.txt'
lines =: <;.2 CR,data
line_to_numbers =: ". @ #~ [: -. (CR,LF)&(e.~)
diff =: }. - }:
all_negatives =: [: */ 0&<
all_positives =: [: */ 0&>
all_same_sign =: all_negatives + all_positives
all_good_range =: [: */ (1 2 3) & (e.~) @ |
safe =: (all_good_range * all_same_sign) @ diff
result_1 =: +/ (safe @ line_to_numbers) &> lines 

subvecs =: ([: -. (i.@#@]) =/ (i.@#@])) # ]
safe_with_removal =: 0< +/"1 (safe"1 @ subvecs @ line_to_numbers) &> lines
safe_without_removal =: (safe @ line_to_numbers) &> lines
safe_somehow =: 0 < (safe_with_removal + safe_without_removal)
result_2 =: +/ safe_somehow
