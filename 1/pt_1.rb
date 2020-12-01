input = File.new('input.txt').readlines.compact

sum = nil
num1 = nil
num2 = nil
puts "length #{input.length}"
for i in 0...(input.length-1)
  num1 = input[i].to_i
  puts "num1 index #{i}: #{num1}"
  for j in (i+1)...(input.length)
    num2 = input[j].to_i
    puts "num2 index #{j}: #{num2}"
    sum = num1 + num2
    puts "sum #{num1} #{num2} = #{sum}"
    break if sum == 2020
  end
  break if sum == 2020
end

puts "num1 #{num1} num2 #{num2} sum #{sum} mult #{num1.to_i * num2.to_i}"
