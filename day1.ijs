data =: 1!:1 < 'Day1_apa.txt'

lines =: <;.1 CR,data

find_crlf =: (13 10 { a.) e.~ [
keep_others =: ] #~ [: -. [
keep_text =: [ keep_others~ [: find_crlf [
long_numbers_from_line =: [: ". keep_text

NB. one liner of the above
numbers_from_lines =: [: ". [ #~ [: -. (13 10{a.) e.~ [

input =: numbers_from_lines &> lines
sort =: [ {~ [: /: [

lefts =: 0 {"1 input
rights =: 1 {"1 input
NB. result_1_1 =: +/ | ((sort lefts) - (sort rights))

NB. sorted =: sort"1 |: input
NB. result_1_1 =: +/ | ({. - {:) sorted
result_1_1 =: +/ | ({. - {:) sort"1 |: input

cnt_in_rights =: [: +/ rights = [
result_1_2 =: +/ lefts * cnt_in_rights"0 lefts
