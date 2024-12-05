data =: [;._1 CR, (#~ LF&~:) 1!:1 < 'day4_apa.txt'
h =: #data
w =: #>{.data
n =: h * w
dirs =: 8 2 $ 1 0  1 1  0 1  _1 1  _1 0  _1 _1  0 _1  1 _1
lines =: dirs */ i.4
good_line =: [: */ [: , (i.w) & (e.~)
pts =: |: (n,2) $, (i.w) ([,])"0/ (i.h)
all_lines =: 2 1 0 |: (2,4,(8*n)) $, pts +/"1 (0|:lines)
good_lines =: (#~ good_line"2) all_lines
word =: {{ (<"1 y) { data }} NB. $y = 4 2
words =: word good_lines
result_1 =: +/ 'XMAS' -:"1 words

star =: {{ word y +"1 (5 2) $ 0 0 1 1 1 _1 _1 _1 _1 1 }}
star_words =: star"1 (((w-2)*(h-2)),2) $, (1+i.w-2) ,"0/ (1+i.h-2)
good_star_word =: {{ +./ y&-: &> 'AMMSS';'AMSSM';'ASMMS';'ASSMM' }} 
result_2 =: +/ good_star_word"1 star_words
