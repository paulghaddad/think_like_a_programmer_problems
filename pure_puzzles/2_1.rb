def upside_down_triangle(height:)
  output = ""

  for row in 1..height
    spaces = row + (row - 2)
    hashes = 2 * height - spaces

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
