=begin
  Design your own: Think up your own symmetrical pattern of hash marks, and see
  whether you can write a program to produce it that follows the shapes rule.
=end

HEIGHT = 8

def hourglass
  output = ""

  for row in 1..HEIGHT
    hashes = 2 * (row - 4.5).abs + 1
    spaces = HEIGHT - hashes

    for space in 1..spaces/2
      output << " "
    end

    for column in 1..hashes
      output << "#"
    end

    for space in 1..spaces/2
      output << " "
    end

    output << "\n"
  end

  output
end

