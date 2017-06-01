require 'pry'

class ISBNValidator
  attr_reader :number, :digits

  def initialize(number:)
    @number = number
    @digits = convert_number_to_digits(number)
  end

  def valid?
    valid_check_digit == calculated_check_digit
  end

  private

  def convert_number_to_digits(number)
    number.to_s.split("").map { |digit| digit.to_i }
  end

  def sum_of_digit_multiples
    sum_of_digit_multiples = 0

    digits_excluding_check_digit.each.with_index do |digit, i|
      multiplied_digit = i.even? ? digit * 1 : digit * 3
      sum_of_digit_multiples += multiplied_digit
    end

    sum_of_digit_multiples
  end

  def valid_check_digit
    mod_10 = sum_of_digit_multiples % 10

    10 - mod_10
  end

  def calculated_check_digit
    digits[-1]
  end

  def digits_excluding_check_digit
    digits[0..-2]
  end
end
