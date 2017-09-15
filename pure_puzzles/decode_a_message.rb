=begin
A message has been encoded as a text stream that is to be read character by character. 
The stream contains a series of comma-delimited integers, each a positive number
capable of being represented by a C++ int. However, the character represented by 
a particular integer depends on the current decoding mode. There are three modes: 
uppercase, lowercase, and punctuation.

In uppercase mode, each integer represents an uppercase letter: The integer modulo 
27 indicates the letter of the alphabet (where 1 = A and so on). So an input value of 
143 in uppercase mode would yield the letter H because 143 modulo 27 is 8 and H is the 
eighth letter in the alphabet.

The lowercase mode works the same but with lowercase letters; the remainder of dividing 
the integer by 27 represents the lowercase letter (1 = a and so on). So an input value 
of 56 in lowercase mode would yield the letter b because 56 modulo 27 is 2 and b is the 
second letter in the alphabet.

In punctuation mode, the integer is instead considered modulo 9, with the interpretation 
given by Table 2-3 below. So 19 would yield an exclamation point because 19 modulo 9 is 1.

At the beginning of each message, the decoding mode is uppercase letters. Each time 
the modulo operation (by 27 or 9, depending on mode) results in 0, the decoding mode 
switches. If the current mode is uppercase, the mode switches to lowercase letters. 
If the current mode is lowercase, the mode switches to punctuation, and if it is 
punctuation, it switched back to uppercase.
=end

MODES = %i(uppercase lowercase punctuation).cycle

PUNCTUATION_DECODING_MAP = {
  1 => "!",
  2 => "?",
  3 => ",",
  4 => ".",
  5 => " ",
  6 => ";",
  7 => "\"",
  8 => "\'"
}

def ascii_converter(character)
  character.ord - "0".ord
end

def capture_message
  loop do
    overall_int = 0

    loop do
      digit_character = gets.chomp

      if digit_character == ","
        case @mode
        when :uppercase
          modulo = overall_int % 27
          if modulo == 0
            @mode = MODES.next
            puts "Switched to #{@mode} mode!"
            break
          end
          puts "Modulo: #{modulo}"
          puts "Mode: #{@mode}"
          puts decode_to_uppercase(modulo)
        when :lowercase
          modulo = overall_int % 27
          if modulo == 0
            @mode = MODES.next
            puts "Switched to #{@mode} mode!"
            break
          end
          puts "Modulo: #{modulo}"
          puts "Mode: #{@mode}"
          puts decode_to_lowercase(modulo)
        when :punctuation
          modulo = overall_int % 9
          if modulo == 0
            @mode = MODES.next
            puts "Switched to #{@mode} mode!"
            break
          end
          puts "Modulo: #{modulo}"
          puts "Mode: #{@mode}"
          puts decode_to_punctuation(modulo)
        end

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

def decode_to_uppercase(number)
  (number + "A".ord - 1).chr
end

def decode_to_lowercase(number)
  (number + "a".ord - 1).chr
end

def decode_to_punctuation(number)
  PUNCTUATION_DECODING_MAP[number]
end

def main
  @mode = MODES.next
  puts "Enter the coded message:"

  capture_message
end

main
