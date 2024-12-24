with open("day24.txt") as f:
  data = f.read().splitlines()

fixes = {"z08": "cdj", "z16": "mrb", "z32": "gfm", "dhm": "qjd"}
def fix(v):
  if v in fixes.keys():
    return fixes[v]
  if v in fixes.values():
    return [k for k, val in fixes.items() if val == v][0]
  return v

dot = "digraph G {\n"
vertices = set()
for line in data:
  parts = line.split(" ")
  if len(parts) == 5:
    op = parts[1]
    # Color the arrows based on the operation.
    # OR: blue, AND: green, XOR: red. Make the arrows thick.
    color = "blue" if op == "OR" else "green" if op == "AND" else "red"
    dot += f"  {parts[0]} -> {fix(parts[4])} [color={color}, penwidth=2];\n"
    dot += f"  {parts[2]} -> {fix(parts[4])} [color={color}, penwidth=2];\n"
    vertices.add(parts[0])
    vertices.add(parts[2])
    vertices.add(fix(parts[4]))
for vertex in vertices:
  # Color vertices starting with x, y and z blue, green and red, respectively.
  # Fill the vertices with the same color as the border.
  if vertex[0] == "x":
    dot += f"  {vertex} [color=blue, style=filled];\n"
  elif vertex[0] == "y":
    dot += f"  {vertex} [color=green, style=filled];\n"
  elif vertex[0] == "z":
    dot += f"  {vertex} [color=red, style=filled];\n"
  else:
    dot += f"  {vertex};\n"
dot += "  rankdir=TD;\n}\n"

with open("day24.dot", "w") as f:
  f.write(dot)

print(",".join(sorted(list(fixes.keys()) + list(fixes.values()))))
