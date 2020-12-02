input = File.new("input").readlines.compact

def valid_password?(params)
  pos1 = params[:pos1]-1
  pos2 = params[:pos2]-1
  letter = params[:letter]
  password = params[:password]

  char_array = password.split("")

  pos1_char = char_array[pos1]
  pos2_char = char_array[pos2]

  valid = !(pos1_char == pos2_char) && (pos1_char == letter || pos2_char == letter)
  puts valid
  puts "#{pos1} #{pos2} #{letter} #{password}: #{valid}\n\n"
  valid
end

count_valid = 0
count_invalid = 0
input.each do |line|
  puts "#{line}"
  matches = line.match(/(\d+)-(\d+) (\w): (.*)/)
  if valid_password?(pos1: matches[1].to_i, pos2: matches[2].to_i, letter: matches[3], password: matches[4])
    count_valid += 1
  else
    count_invalid += 1
  end
end

puts "valid: #{count_valid}, invalid: #{count_invalid}"
