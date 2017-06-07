require "./sorter"

describe Sorter do
  it "sorts an array" do
    unsorted_array = [2, 8, 4, 1]

    sorter = Sorter.new(unsorted_array)

    expect(sorter.insertion_sort).to eq([1, 2, 4, 8])
  end

  context "single element array" do
    it "returns the already sorted array" do
      unsorted_array = [1]

      sorter = Sorter.new(unsorted_array)

      expect(sorter.insertion_sort).to eq([1])
    end
  end
end
