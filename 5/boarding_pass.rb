class BoardingPass
  def initialize(row_string)
    @raw = row_string.strip
    @row = calculate_row(@raw.slice(0,7))
    @column = calculate_column(@raw.slice(7,3))
  end

  def seat_id
    @row * 8 + @column
  end

  def to_s
    "Row #{@row}, Seat #{@column}, ID: #{seat_id}"
  end

  protected

  def calculate_row(row_chars)
    raise "Incorrect row input '#{row_chars}'" unless row_chars.match?(/^(F|B){7,7}$/)
    bitwise(row_chars, 'B')
  end

  def calculate_column(column_chars)
    raise "Incorrect column input '#{column_chars}'" unless column_chars.match?(/^(R|L){3,3}$/)
    bitwise(column_chars, 'R')
  end

  def bitwise(chars, upper_char)
    result = 0
    chars.split('').each_with_index do |char, i|
      if char == upper_char
        result |= 2**(chars.length - i - 1)
      end
    end
    result
  end
end