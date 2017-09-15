=begin
  Write a program to produce a pattern of hash symbols shaped like a sideways
  triangle:

  #
  ##
  ###
  ####
  ###
  ##
  #
=end

def sideways_triangle(height:)
  output = ""

  for row in 1..(2 * height - 1)
    for _column in 1..(-1 * (height - row).abs + height)
      output << "#"
    end

    output << "\n"
  end

  output
end
