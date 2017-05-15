require "./ascii_converter"
require "pry"

class SimpleChecksumValidation
  attr_reader :input_number

  def initialize(input_number:)
    @input_number = input_number
  end

  def valid?
    sum = 0

    for i in 0...6
      character = input_number[i]
      digit = AsciiConverter.convert_to_integer(character: character)
      sum += digit
    end

    sum % 10 == 0
  end
end
