INPUT = File.new("input").readlines.compact
TOTAL_X = INPUT[0].strip.length
TOTAL_Y = INPUT.length

def tree?(char)
  char == '#'
end

def position_is_tree?(x, y)
  input_x = x % TOTAL_X
  tree?(INPUT[y][input_x])
end

x = 0
y = 0
trees = 0

delta_x = 3
delta_y = 1

while(y < TOTAL_Y) do
  trees += 1 if position_is_tree?(x, y)
  x += delta_x
  y += delta_y
end

puts trees
