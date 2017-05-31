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
