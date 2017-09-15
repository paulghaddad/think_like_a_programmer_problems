=begin
  In statistics, the mode of a set of values is the value that appears most 
  often. Write code that processes an array of survey data, whether survey takers
  have responded to a question with a number in the range 1-10, to determine the
  mode of the data set. For our purpose, if multiple modes exist, any may be chosen.
=end

class StatisticsAnalyzer
  MAX_RESPONSE = 10

  attr_reader :collection

  def initialize(collection:)
    @collection = collection
  end

  def mode
    histogram = build_histogram(collection)

    most_frequent = 0
    mode = nil

    histogram.each.with_index do |frequency, index|
      if frequency > most_frequent
        most_frequent = frequency
        mode = index + 1
      end
    end

    mode
  end

  private

  def build_histogram(elements)
    histogram = Array.new(MAX_RESPONSE, 0)

    elements.each do |element|
      histogram[element - 1] += 1
    end

    histogram
  end
end
