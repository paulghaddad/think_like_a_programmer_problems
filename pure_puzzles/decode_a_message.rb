require 'pry'

def ascii_converter(character)
  character.ord - "0".ord
end

def main
  # read in a stream of text until a line break is reached

  puts "Enter the coded message:"

  loop do
    overall_int = 0

    loop do
      digit_character = gets.chomp

      if digit_character == ","
        puts overall_int
        break
      end

      if digit_character == ""
        puts overall_int
        return
      end

      overall_int = (overall_int * 10 + ascii_converter(digit_character))
    end
  end
end

main

