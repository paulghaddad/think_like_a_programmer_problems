class BinaryStringAnalyzer
  def self.odd_parity_1?(binary_numbers)
    bool_1?(binary_numbers)
  end

  def self.odd_parity_2?(binary_numbers)
    odd_count = self.odd_count(binary_numbers)
    odd_count.odd?
  end

  def self.odd_count(binary_numbers)
    return 0 if binary_numbers.empty?
    odd_count = odd_count(binary_numbers[0..-2])

    if binary_numbers[-1].to_i.odd?
      odd_count += 1
    else
      odd_count
    end
  end

  private

  def self.bool_1?(binary_numbers)
    return false if binary_numbers.empty?

    first_int = binary_numbers.first

    first_int.odd? ^ self.bool_1?(binary_numbers[1..-1])
  end
end
