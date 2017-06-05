require 'pry'

class NumberSystemConverter
  attr_reader :number, :base

  def initialize(number:, base:)
    @number = number
    @base = base
  end

  def to_binary
    binary_digits = []
    absolute_value = number.abs

    while absolute_value > 0
      binary_digits << absolute_value % 2
      absolute_value /= 2
    end

    binary_number = ""
    until binary_digits.empty?
      binary_number += binary_digits.pop.to_s
    end

    sign * binary_number.to_i
  end

  def to_decimal
    base = 2
    binary_digits = number.to_s.split("").map(&:to_i)
    number_of_digits = binary_digits.size
    exponential_factor = number_of_digits - 1

    decimal_number = 0
    binary_digits.each.with_index do |digit, index|
      exponential_factor = number_of_digits - index - 1
      decimal_number += digit * base ** exponential_factor
    end

    sign * decimal_number
  end

  private

  def sign
    number.zero? ? 1 : number / number.abs
  end
end
