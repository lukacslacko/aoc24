data =: [;._1 LF,CR-.~1!:1 < 'day8.txt'
size =: #data
indices =: i.size
coords =: ,{;~ indices
grouped_coords =: (,data) </. coords
stations =: ('.' ~: ~.,data) # grouped_coords
pairsfn =: [:, [:{ ;/ ,. 1&(<\.)
antinode =: {{ y&{{ ({.+{.-{:) > y{x }} &.> ,. (pairsfn i.#y) }}
antinodes =: {."1 ; antinode &.> stations
result_1 =: # coords -. coords -. antinodes

lines =: >&.> ; {{ {&y &.> pairsfn i.#y }} &.> stations
dirs =: {{ ({.y); (] % +./) -/y }} &.> lines
line_points =: {{ (>{.y) +"_ 1 (>{:y) (*"_ 0) indices }} &.> dirs
result_2 =: # coords -. coords -. ;/;line_points