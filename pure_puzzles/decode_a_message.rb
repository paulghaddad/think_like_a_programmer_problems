def main
  # read in a stream of text until a line break is reached

  puts "Enter the coded message:"

  loop do
    input_text = gets.chomp
    break if input_text == ""
  end

  puts "end of line"
end

main
