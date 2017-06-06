class NumberSystemConverter
  CHARACTER_TO_NUMBER_MAP = {
    "0" => 0,
    "1" => 1,
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
    "A" => 10,
    "B" => 11,
    "C" => 12,
    "D" => 13,
    "E" => 14,
    "F" => 15
  }

  NUMBER_TO_CHARACTER_MAP = {
    0 => "0",
    1 => "1",
    2 => "2",
    3 => "3",
    4 => "4",
    5 => "5",
    6 => "6",
    7 => "7",
    8 => "8",
    9 => "9",
    10 => "A",
    11 => "B",
    12 => "C",
    13 => "D",
    14 => "E",
    15 => "F"
  }

  attr_reader :number, :base

  def initialize(number:, base:)
    @number = String(number)
    @base = base
  end

  def to_base(base)
    decimal_number = to_decimal.to_i.abs
    return "0" if number == "0"

    converted_number = ""

    while decimal_number > 0
      new_digit = NUMBER_TO_CHARACTER_MAP.fetch(decimal_number % base)
      converted_number.prepend(new_digit)
      decimal_number /= base
    end

    if number.start_with?("-")
      converted_number.prepend("-")
    else
      converted_number
    end
  end

  def to_decimal
    digits = normalize_digits
    number_of_digits = digits.size
    exponential_factor = number_of_digits - 1

    decimal_number = 0
    digits.each.with_index do |digit, index|
      exponential_factor = number_of_digits - index - 1
      decimal_number += digit * base ** exponential_factor
    end

    if number.start_with?("-")
      String(decimal_number * -1)
    else
      String(decimal_number)
    end
  end

  private

  def normalize_digits
    absolute_value = number.gsub("-", "")
    absolute_value.split("").map { |digit| CHARACTER_TO_NUMBER_MAP.fetch(digit) }
  end

  def sign
    number.start_with?("-") ? -1 : 1
  end
end
