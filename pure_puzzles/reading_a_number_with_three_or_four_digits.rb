=begin
  Write a program to read a number character by character and convert it to an
  integer, using just one char variable and one int variable. The number will have
  either three or four digits.
=end

def convert_three_or_four_digit_char_to_int
  puts "Please enter a three or four digit number: "
  overall_int = 0

  loop do
    digit_character = gets.chomp

    break if digit_character == ""

    overall_int = (overall_int * 10 + ascii_converter(digit_character))
  end

  overall_int
end

def ascii_converter(character)
  character.ord - "0".ord
end

puts convert_three_or_four_digit_char_to_int
