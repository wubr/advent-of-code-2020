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

totals = []

[[1,1], [3,1], [5,1], [7,1], [1,2]].each do |delta_x, delta_y|
  x = 0
  y = 0
  trees = 0

  while(y < TOTAL_Y) do
    trees += 1 if position_is_tree?(x, y)
    x += delta_x
    y += delta_y
  end

  puts "#{[delta_x, delta_y]} #{trees}"
  totals.push(trees)
end

puts totals.reduce(1, :*)

