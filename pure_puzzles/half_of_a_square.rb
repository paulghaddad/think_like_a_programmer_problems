def half_of_a_square(height:)
  # height.downto(1).inject("") do |shape, line_number|
  #   shape << "#{'#' * line_number}\n"
  # end

  # Using a for loop

  # shape = ""
  #
  # for i in height..1
  #   shape << "#{'#' * i}\n"
  # end
  #
  # shape

  output = ""

  for row in 1..height
    for _column in 1..(height + 1 - row)
      output << "#"
    end

    output << "\n"
  end

  output
end
