require 'pry'

class BinaryDecimalConverter
  def self.to_binary(decimal_number)
    binary_digits = []
    sign = sign(decimal_number)
    decimal_number_abs = decimal_number.abs

    while decimal_number_abs > 0
      binary_digits << decimal_number_abs % 2
      decimal_number_abs /= 2
    end

    binary_number = ""

    until binary_digits.empty?
      binary_number += binary_digits.pop.to_s
    end

    sign * binary_number.to_i
  end

  def self.to_decimal(binary_number)
    binary_digits = binary_number.to_s.split("").map(&:to_i)
    max_digits_place = binary_digits.size - 1
    sign = sign(binary_number)

    decimal_number = 0
    max_digits_place.downto(0) do |digit_place|
      decimal_number += sign * binary_digits[max_digits_place - digit_place] * 2 ** digit_place
    end

    decimal_number
  end

  private

  def self.sign(number)
    number.zero? ? 1 : number / number.abs
  end
end
