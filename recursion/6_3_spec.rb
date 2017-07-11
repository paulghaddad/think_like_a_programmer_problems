require "./6_3"

describe "Problem 6.3" do
  describe "#count_of_target_iterative" do
    it "retrns the number of times the target element is in the collection" do
      array = [1, 8, 2, 8, 8, 5, 8]

      target_count = count_of_target_iterative(collection: array, target: 8)

      expect(target_count).to eq(4)
    end
  end

  describe "#count_of_target_head_recursive" do
    it "retrns the number of times the target element is in the collection" do
      array = [1, 8, 2, 8, 8, 5, 8]

      target_count = count_of_target_head_recursive(collection: array, target: 8)

      expect(target_count).to eq(4)
    end
  end

  describe "#count_of_target_tail_recursive" do
    it "retrns the number of times the target element is in the collection" do
      array = [1, 8, 2, 8, 8, 5, 8]

      target_count = count_of_target_tail_recursive(collection: array, target: 8)

      expect(target_count).to eq(4)
    end
  end
end
