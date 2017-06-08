class StatisticsAnalyzer
  attr_reader :collection

  def initialize(collection:)
    @collection = collection
  end

  def mode
    highest_frequency = 0
    current_frequency = 0
    i = 0

    collection.sort.inject(nil) do |most_frequent, current_element|
      current_frequency += 1

      if i == collection.size || current_element != collection[i + 1]
        if current_frequency > highest_frequency
          highest_frequency = current_frequency
          most_frequent = current_element
        end

        current_frequency = 0
      end

      i += 1
      most_frequent
    end
  end
end
