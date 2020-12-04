require 'byebug'

class Passport
  FIELDS = {
    'byr' => :@birth_year,
    'iyr' => :@issue_year,
    'eyr' => :@expiration_year,
    'hgt' => :@height,
    'hcl' => :@hair_color,
    'ecl' => :@eye_color,
    'pid' => :@passport_id,
    'cid' => :@country_id
  }

  def initialize(data)
    parse_passport_data(data)
  end

  def valid_passport?
    check_required_fields_present(FIELDS) && check_field_data
  end

  def valid_north_pole_creds?
    req_fields = FIELDS.reject { |key, _value| key == "cid" }
    check_required_fields_present(req_fields) && check_field_data
  end

  def check_field_data
    check_year @birth_year, min: 1920, max: 2002
  end

  def to_s
    output = ""
    FIELDS.each do |str, sym|
      output += "#{str}: #{instance_variable_get(sym)}\n"
    end
    output += "valid passport: #{valid_passport?}\n"
    output += "valid NP creds: #{valid_north_pole_creds?}\n"
    output
  end

  protected

  def check_required_fields_present(fields)
    valid = fields.inject(true) { |memo, (_field_str, field_sym)| instance_variable_get(field_sym) && memo }
    valid
  end

  def parse_passport_data(data)
    data.each do |line|
      data_fields = line.split(" ")
      data_fields.each do |data_field|
        matches = data_field.match(/^(\w+):(.*)$/)
        if FIELDS.key?(matches[1])
          instance_variable_set(FIELDS[matches[1]], matches[2])
        end
      end
    end
  end
end