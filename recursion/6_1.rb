require 'pry'

class ArrayAnalyer
  def self.sum_with_iterative_solution(array)
    sum = 0

    array.each do |element|
      sum += element if element.positive?
    end

    sum
  end

  def self.sum_with_recursive_solution(array)
    return 0 if array.empty?

    last_number = array[-1]

    last_number = 0 if last_number.negative?

    last_number + sum_with_recursive_solution(array[0...-1])
  end
end
