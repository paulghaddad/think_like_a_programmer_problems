=begin
  Using only single character output statements that output a hash mark, a space, 
  or an end-of-line, write a program that produces the following shape:

     ##
    ####
   ######
  ########
  ########
   ######
    ####
     ##
=end

def upside_down_triangle(height:)
  output = ""

  for row in 1..height
    spaces = (2 * row - (height + 1)).abs - 1
    hashes = height - spaces

    for column in 1..spaces/2
      output << " "
    end

    for column in 1..hashes
      output << "#"
    end

    for column in 1..spaces/2
      output << " "
    end

    output << "\n"
  end

  output
end
