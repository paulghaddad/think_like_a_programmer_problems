=begin
  Write a program that uses only two output statements to produce a pattern of
  hash symbols shaped like half of a perfect 5 x 5 square (for a right triangle):

  #####
  ####
  ###
  ##
  #
=end

def half_of_a_square(height:)
  output = ""

  for row in 1..height
    for _column in 1..(height + 1 - row)
      output << "#"
    end

    output << "\n"
  end

  output
end
