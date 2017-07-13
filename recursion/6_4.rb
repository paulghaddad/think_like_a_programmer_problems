class GreatestCommonDenoninator
  def self.calculate(number_1, number_2)
    smaller_int, larger_int = [number_1, number_2].sort

    remainder = larger_int % smaller_int

    return smaller_int if remainder.zero?

    self.calculate(smaller_int, remainder)
  end
end
