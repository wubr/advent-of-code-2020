require "./passport_two"
require "active_support/core_ext"

INPUT = File.new("input").readlines

passport_data = []
valid_passports = 0
total_passports = 0
INPUT.each_with_index do |line, index|
  if line.blank? || index == INPUT.length - 1
    if index == INPUT.length - 1
      passport_data.push(line)
    end
    passport = PassportTwo.new passport_data
    if passport.valid?
      valid_passports += 1
    end
    passport_data = []
    total_passports += 1
  else
    passport_data.push(line)
  end
end

puts "total #{total_passports}"
puts "valid #{valid_passports}"
