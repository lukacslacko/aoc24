ARROWS = {
  ' ': (0,0),
  '^': (0,1),
  'A': (0,2),
  '<': (1,0),
  'v': (1,1),
  '>': (1,2),
}

NUMS = {
  '7': (0,0),
  '8': (0,1),
  '9': (0,2),
  '4': (1,0),
  '5': (1,1),
  '6': (1,2),
  '1': (2,0),
  '2': (2,1),
  '3': (2,2),
  ' ': (3,0),
  '0': (3,1),
  'A': (3,2),
}

class Controller:
  def cost_of(self, button):
    return 1
  
class RobotController:
  def __init__(self, controller, lookup):
    self.controller = controller
    self.lookup = lookup
    self.pos = lookup['A']
    self.gap_pos = lookup[' ']
    self.mem = {}

  def cost_of(self, button):
    new_pos = self.lookup[button]
    key = (self.pos, new_pos)
    if key in self.mem:
      self.pos = new_pos
      return self.mem[key]
    dr = new_pos[0] - self.pos[0]
    dc = new_pos[1] - self.pos[1]
    horiz = '>' if dc > 0 else '<'
    vert = 'v' if dr > 0 else '^'
    horiz_vert_corner = (self.pos[0], new_pos[1])
    vert_horiz_corner = (new_pos[0], self.pos[1])
    if horiz_vert_corner != self.gap_pos:
      horiz_vert_cost = 0
      for _ in range(abs(dc)):
        horiz_vert_cost += self.controller.cost_of(horiz)
      for _ in range(abs(dr)):
        horiz_vert_cost += self.controller.cost_of(vert)
      horiz_vert_cost += self.controller.cost_of('A')
    else:
      horiz_vert_cost = 99999999999
    if vert_horiz_corner != self.gap_pos:
      vert_horiz_cost = 0
      for _ in range(abs(dr)):
        vert_horiz_cost += self.controller.cost_of(vert)
      for _ in range(abs(dc)):
        vert_horiz_cost += self.controller.cost_of(horiz)
      vert_horiz_cost += self.controller.cost_of('A')
    else:
      vert_horiz_cost = 99999999999
    result = min(horiz_vert_cost, vert_horiz_cost)
    self.mem[key] = result
    self.pos = new_pos
    return result
  
  def str(self, s):
    cost = 0
    for c in s:
      cost += self.cost_of(c)
    return cost

human = Controller()
first_robot = RobotController(human, ARROWS)
second_robot = RobotController(first_robot, ARROWS)
third_robot = RobotController(second_robot, NUMS)

cost = 0
for c in '029A':
  cost += third_robot.cost_of(c)
print(cost)

total = 0
for s in ['965A', '143A', '528A', '670A', '973A']:
# for s in ['029A', '980A', '179A', '456A', '379A']:
  c = third_robot.str(s)
  total += c * int(s[:3])
  print(s, third_robot.str(s), total)

# value = 0
# # 235218 too high
# for input in ['965A', '143A', '528A', '670A', '973A']:
#   human = HumanController()
#   setup = Numpad(RobotController(RobotController(human)))
#   for c in input:
#     setup.press(c)
#   value += len(human.result()) * int(input[:3])
# print(value)
