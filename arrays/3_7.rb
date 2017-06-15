class ArrayAnalyzer
  attr_reader :array, :min, :max

  def initialize(array)
    @array = array
    @min = array.min
    @max = array.max
  end

  def mode
    histogram = generate_histogram

    calculate_mode(histogram)
  end

  private

  def generate_histogram
    frequency_counter = Array.new(max - min + 1, 0)

    array.inject(frequency_counter) do |counter, value|
      counter[value - min] += 1
      counter
    end
  end

  def calculate_mode(histogram)
    modes = []
    highest_count = histogram.max

    histogram.each.with_index do |count, index|
      if count == highest_count
        modes << index + min
      end
    end

    modes
  end
end
