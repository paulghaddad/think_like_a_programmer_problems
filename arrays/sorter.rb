class Sorter
  attr_reader :elements

  def initialize(elements)
    @elements = elements
  end

  def insertion_sort
    start_index = 0
    end_index = elements.size - 1

    for i in start_index..end_index
      j = i

      while j > start_index && elements[j - 1] > elements[j]
        temp = elements[j - 1]
        elements[j - 1] = elements[j]
        elements[j] = temp
        j -= 1
      end
    end

    elements
  end
end
