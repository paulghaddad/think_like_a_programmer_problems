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
