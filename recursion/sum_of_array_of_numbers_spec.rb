require "./sum_of_array_of_numbers"

describe "#array_sum" do
  context "iterative solution" do
    it "sums all the numbers in an array" do
      array = [1, 2, 3]

      array_sum = array_iterative_sum(array, array.size)

      expect(array_sum).to eq(6)
    end
  end

  context "middle solution" do
    it "sums all the numbers in an array" do
      array = [1, 2, 3]

      array_sum = array_delegate_sum(array, array.size)

      expect(array_sum).to eq(6)
    end
  end

  context "recursive solution" do
    it "sums all the numbers in an array" do
      array = [1, 2, 3]

      array_sum = array_recursive_sum(array, array.size)

      expect(array_sum).to eq(6)
    end
  end
end
