class ArrayAnalyzer
  attr_reader :array, :num_elements

  def initialize(array:, num_elements:)
    @array = array
    @num_elements = num_elements
  end

  def bool
    for i in 1...num_elements
      if array[i] > array[i - 1]
        next
      else
        return false
      end
    end

    true
  end
end
