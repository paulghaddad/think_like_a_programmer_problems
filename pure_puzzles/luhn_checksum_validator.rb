=begin
  The Luhn formula is a widely used system for validating identification numbers.
   Using the original number, double the value of every other digit. Then add
   the values of the individual digits together (if a doubled value now has two digits,
   add the digits individually). The identification number is valid if the sum is
   divisible by 10.

   Write a program that takes an identification number of arbitrary length and
   determines whether the number is valid under the Luhn formula. The program
   must process each character before reading the next one.
=end

require "./ascii_converter"

class LuhnChecksum
  def initialize(input_number:)
    @input_number = input_number
  end

  def valid?
    checksum = 0

    for i in 0..(@input_number.length - 1)
      digit = AsciiConverter.convert_to_integer(character: @input_number[i])

      if i % 2 != 0
        checksum += double_digit(digit)
      else
        checksum += digit
      end
    end

    divisible_by_10?(checksum)
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

  def divisible_by_10?(number)
    number % 10 == 0
  end
end
