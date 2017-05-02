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
