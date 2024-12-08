data =: [;._1 LF,CR-.~1!:1 < 'day8.txt'
size =: #data
coords =: ,{;~i.size
grouped_coords =: (,data) </. coords
stations =: ('.' ~: ~.,data) # grouped_coords