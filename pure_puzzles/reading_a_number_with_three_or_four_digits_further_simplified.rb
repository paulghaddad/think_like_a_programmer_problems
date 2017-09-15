=begin
  Write a program to read a number character by character and convert it to an
  integer, using just one char variable and two int variables. The number will have 
  either three or four digits.
=end

def convert_three_or_four_digit_char_to_int
  puts "Please enter a three or four digit number: "
  overall_int_for_three_digits = 0
  overall_int_for_four_digits = 0

  digit_character = gets.chomp
  overall_int_for_three_digits += integer(digit_character) * 10 ** 2
  overall_int_for_four_digits += integer(digit_character) * 10 ** 3

  digit_character = gets.chomp
  overall_int_for_three_digits += integer(digit_character) * 10 ** 1
  overall_int_for_four_digits += integer(digit_character) * 10 ** 2

  digit_character = gets.chomp
  overall_int_for_three_digits += integer(digit_character) * 10 ** 0
  overall_int_for_four_digits += integer(digit_character) * 10 ** 1

  digit_character = gets.chomp

  if digit_character == ""
    overall_int_for_three_digits
  else
    overall_int_for_four_digits += integer(digit_character) * 10 ** 0
  end
end

def integer(character)
  character.ord - "0".ord
end

puts convert_three_or_four_digit_char_to_int
