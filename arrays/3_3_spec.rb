require "./3_3"

describe ArrayAnalyzer do
  describe "#bool" do
    context "array is sorted" do
      it "returns true" do
        sorted_array = [1, 2, 3, 4, 5]

        analyzer = ArrayAnalyzer.new(array: sorted_array, num_elements: 5)

        expect(analyzer.bool).to be true
      end
    end

    context "array is not sorted" do
      it "returns false" do
        unsorted_array = [3, 1, 2, 5, 4]

        analyzer = ArrayAnalyzer.new(array: unsorted_array, num_elements: 5)

        expect(analyzer.bool).to be false
      end
    end
  end
end
