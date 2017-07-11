class BinaryStringAnalyzer
  def self.bool?(binary_string)
    return false if binary_string == ""

    first_char = binary_string[0].to_i

    first_char.odd? ^ self.bool?(binary_string[1..-1])
  end
end
