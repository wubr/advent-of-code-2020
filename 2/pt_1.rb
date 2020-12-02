input = File.new("input").readlines.compact

def valid_password?(params)
  range = (params[:min]..params[:max])
  letter = params[:letter]
  password = params[:password]

  char_array = password.split("")
  count_hash = {}
  char_array.each do |char|
    count_hash[char] ||= 0
    count_hash[char] = count_hash[char] + 1
  end
  puts range
  puts count_hash

  occurrances = count_hash[letter]
  puts occurrances
  puts range.include? occurrances
  # valid = (range.include? occurrances ? true : false)
  valid = range.include? occurrances
  puts valid
  puts "#{range} #{letter} #{password}: #{valid}\n\n"
  valid
end

count_valid = 0
count_invalid = 0
input.each do |line|
  puts "#{line}"
  matches = line.match(/(\d+)-(\d+) (\w): (.*)/)
  if valid_password?(min: matches[1].to_i, max: matches[2].to_i, letter: matches[3], password: matches[4])
    count_valid += 1
  else
    count_invalid += 1
  end
end

puts "valid: #{count_valid}, invalid: #{count_invalid}"
