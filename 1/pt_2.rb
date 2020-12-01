input = File.new('input.txt').readlines.compact

sum = nil
num1 = nil
num2 = nil
num3 = nil
puts "length #{input.length}"
for i in 0...(input.length-2)
  num1 = input[i].to_i
  for j in (i+1)...(input.length-1)
    num2 = input[j].to_i
      for k in (j+1)...(input.length)
        num3 = input[k].to_i
        sum = num1 + num2 + num3
        break if sum === 2020
      end
    break if sum == 2020
  end
  break if sum == 2020
end

puts "num1 #{num1} num2 #{num2} num3 #{num3} sum #{sum} mult #{num1 * num2 * num3}"
