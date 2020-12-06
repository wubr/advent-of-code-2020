require './boarding_pass'

INPUT = File.new("input").readlines

missing_ids = Array.new(818, true)
highest_id = 0
INPUT.each do |row|
  pass = BoardingPass.new(row)
  puts pass
  highest_id = pass.seat_id if pass.seat_id > highest_id
  missing_ids[pass.seat_id] = false
end

puts "Highest ID: #{highest_id}"
puts "missing Ids:"
missing_ids.each_with_index do |value, i|
  puts i if value
end
