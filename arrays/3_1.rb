require 'pry'

class QSort
  def self.sort_array(collection, comparison_function)
    collection.sort(&comparison_function)
  end

  def self.sort_struct(collection:, sort_by_attribute:)
    comparison_function = Proc.new do |a, b|
      a.send(sort_by_attribute) <=> b.send(sort_by_attribute)
    end

    collection.sort(&comparison_function)
  end
end
