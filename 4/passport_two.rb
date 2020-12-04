require 'byebug'

class PassportTwo
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

  def valid?
    (valid_passport? || valid_north_pole_creds?) && valid_field_data? ? true : false
  end

  def valid_passport?
    check_required_fields_present(FIELDS)
  end

  def valid_north_pole_creds?
    req_fields = FIELDS.reject { |key, _value| key == "cid" }
    check_required_fields_present(req_fields)
  end

  def valid_field_data?
    valid = true
    valid &&= check_year({year: @birth_year, min: 1920, max: 2002})
    valid &&= check_year({year: @issue_year, min: 2010, max: 2020})
    valid &&= check_year({year: @expiration_year, min: 2020, max: 2030})
    valid &&= check_height
    valid &&= check_hair_color
    valid &&= check_eye_color
    valid &&= check_passport_id
    valid
  end

  def check_eye_color
    ['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth'].include? @eye_color
  end

  def check_passport_id
    @passport_id =~ /^0*\d{9,9}$/
  end

  def check_hair_color
    @hair_color =~ /\#[0-9a-f]{6,6}/
  end

  def check_height
    matches = @height.match(/(\d+)(cm|in)/)
    return unless matches
    height = matches[1].to_i
    if matches[2] == 'cm'
      height >= 150 && height <= 193
    elsif matches[2] == 'in'
      height >= 59 && height <= 76
    else
      false
    end
  end

  def check_year(params)
    year = params[:year]
    if year =~ /\d{4,4}/
      return year.to_i >= params[:min].to_i && year.to_i <= params[:max].to_i
    end

    false
  end

  def to_s
    output = ""
    FIELDS.each do |str, sym|
      output += "#{str}: #{instance_variable_get(sym)}\n"
    end
    output += "valid passport: #{valid?}\n"
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