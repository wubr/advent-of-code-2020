require "./passport"
require "active_support/core_ext"

INPUT = File.new("input").readlines
puts INPUT

passport_data = []
valid_passports = 0
total_passports = 0
INPUT.each_with_index do |line, index|
  if line.blank? || index == INPUT.length - 1
    if index == INPUT.length - 1
      passport_data.push(line)
    end
    passport = Passport.new passport_data
    if (passport.valid_north_pole_creds? || passport.valid_passport?)
      valid_passports += 1
    end
    puts '*'*80
    puts "L#{index + 1}"
    puts "#{passport_data.length} lines"
    puts passport_data
    puts ''
    puts passport
    passport_data = []
    total_passports += 1
  else
    passport_data.push(line)
  end
end

puts "total #{total_passports}"
puts "valid #{valid_passports}"
