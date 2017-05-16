require "./ascii_converter"
require "pry"

class VariableLengthLuhnValidator
  attr_reader :input_number

  def initialize(input_number:)
    @input_number = input_number
  end

  def valid?
    even_length_checksum = 0
    odd_length_checksum = 0
    position = 0

    loop do
      character = input_number[position]
      break if character == "\n"

      digit = AsciiConverter.convert_to_integer(character: character)

      if position % 2 != 0
        even_length_checksum += double_digit(digit)
        odd_length_checksum += digit
      else
        even_length_checksum += digit
        odd_length_checksum += double_digit(digit)
      end

      position += 1
    end

    if position % 2 == 0
      checksum = even_length_checksum
    else
      checksum = odd_length_checksum
    end

    checksum % 10 == 0
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
