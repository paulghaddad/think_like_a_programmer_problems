class BinaryStringAnalyzer
  def self.bool?(binary_string)
    return false if binary_string == ""

    first_char = binary_string[0].to_i

    first_char.odd? ^ self.bool?(binary_string[1..-1])
  end

  def self.bool_2?(binary_string)
    odd_count = self.odd_count(binary_string)
    odd_count.odd?
  end

  def self.odd_count(binary_string)
    return 0 if binary_string == ""
    odd_count = odd_count(binary_string[0..-2])

    if binary_string[-1].to_i.odd?
      odd_count += 1
    else
      odd_count
    end
  end
end
