require "./6_1"

describe "Problem 6.1" do
  describe "iterative solution" do
    it "sums the positive elements in an array" do
      array = [1, 2, 3, -4]

      sum = ArrayAnalyer.sum_with_iterative_solution(array)

      expect(sum).to eq(6)
    end
  end

  describe "recursive solution" do
    it "sums the positive elements in an array" do
      array = [1, 2, 3, -4]

      sum = ArrayAnalyer.sum_with_recursive_solution(array)

      expect(sum).to eq(6)
    end
  end
end
