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
