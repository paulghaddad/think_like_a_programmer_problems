=begin
  Write a program that uses only two output statements to produce a pattern of
  hash symbols shaped like a perfect 5x5 square.

  #####
  #####
  #####
  #####
  #####
=end

def square(height:)
  # Using Ruby Block syntax
  # output = ""
  #
  # height.times do
  #   output << "#{'#' * 5}\n"
  # end
  #
  # output

  # Using for loops
  output = ""

  for row in 0...height
    for hash in 0...height
      output << "#"
    end
    output << "\n"
  end

  output
end
