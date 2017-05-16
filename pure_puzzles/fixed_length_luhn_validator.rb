require "./ascii_converter"
require 'pry'

class FixedLengthLuhnValidator
  attr_reader :input_number

  def initialize(input_number:)
    @input_number = input_number
  end

  def valid?
    sum = 0

    for i in 0...6
      character = input_number[i]
      digit = AsciiConverter.convert_to_integer(character: character)

      if i % 2 != 0
        digit = double_digit(digit)
      end

      sum += digit
    end

    sum % 10 == 0
  end

  private

  def double_digit(digit)
    sum = 0
    doubled_digit = digit * 2

    if doubled_digit > 9
      sum += 1 + doubled_digit % 10
    else
      sum += doubled_digit
    end
  end
end
