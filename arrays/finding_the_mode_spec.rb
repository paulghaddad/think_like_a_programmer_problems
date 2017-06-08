require "./finding_the_mode"

describe StatisticsAnalyzer do
  describe "#mode" do
    it "returns the highest occurring element of the array" do
      elements = [4, 7, 3, 8, 9, 7, 3, 9, 9, 3, 3, 10]

      statistics_analyzer = StatisticsAnalyzer.new(collection: elements)

      expect(statistics_analyzer.mode).to eq(3)
    end
  end
end
