=begin
  Write a line of code that goes in the designated position in th eloop in the
  listing below. The program displays the numbers 5 through 1, in that order,
  with each number on a separate line.
=end

def count_down(max)
  output = ""

  1.upto(max) do |i|
    output << "#{-i + max + 1}\n"
  end

  output


  # Using a for loop
  # output = ""
  #
  # for i in 1..max
  #   output << "#{-i + max + 1}\n"
  # end
  #
  # output
end
