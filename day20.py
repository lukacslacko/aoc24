data = []
with open("day20_apa.txt") as f:
    for line in f.read().splitlines():
      data.append(list(line))
for r, row in enumerate(data):
  for c, char in enumerate(row):
    if char == "S":
      start = (r, c)
    if char == "E":
      end = (r, c)
data[start[0]][start[1]] = "."
data[end[0]][end[1]] = "."
size = len(data)
coords = [(r,c) for r in range(size) for c in range(size)]
dists = [([-1] * size) for _ in range(size)]
dists[start[0]][start[1]] = 0
pos = start
value = 0
while pos != end:
  nexts = [(pos[0]+1, pos[1]), (pos[0]-1, pos[1]), (pos[0], pos[1]+1), (pos[0], pos[1]-1)]
  good_next = None
  for next_pos in nexts:
    if next_pos in coords and data[next_pos[0]][next_pos[1]] == "." and dists[next_pos[0]][next_pos[1]] == -1:
      good_next = next_pos
      break
  dists[good_next[0]][good_next[1]] = value + 1
  pos = good_next
  value += 1
print(dists[end[0]][end[1]])
good_cheats = 0
old_good_cheats = 0
for r in range(size):
  print(r, good_cheats - old_good_cheats, good_cheats)
  old_good_cheats = good_cheats
  for c in range(size):
    if dists[r][c] == -1:
      continue
    # Let jump go between 1 and 20, inclusive.
    for jump in range(1, 21):
      other_ends = set()
      # Let dr go between -jump and jump, inclusive.
      for dr in range(-jump, jump+1):
        rr = r + dr
        for dc in [jump - abs(dr), -jump + abs(dr)]:
          if (rr, c+dc) in coords and dists[rr][c+dc] != -1:
            other_ends.add((rr, c+dc))
      for other_end in other_ends:
        diff = dists[other_end[0]][other_end[1]] - dists[r][c]
        if diff - jump >= 100:
          good_cheats += 1
print(good_cheats)