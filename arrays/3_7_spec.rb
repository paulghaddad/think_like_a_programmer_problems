require "./3_7"

describe "Problem 3-7" do
  describe "#mode" do
    context "single mode" do
      it "returns the most frequent number" do
        array = [2, 6, 2, 5, 2, 7]

        array_analyzer = ArrayAnalyzer.new(array)

        expect(array_analyzer.mode).to contain_exactly(2)
      end
    end

    context "multiple modes" do
      it "returns the most frequent numbers" do
        array = [2, 6, 2, 5, 2, 7, 8, 8, 8]

        array_analyzer = ArrayAnalyzer.new(array)

        expect(array_analyzer.mode).to contain_exactly(2, 8)
      end
    end
  end
end
