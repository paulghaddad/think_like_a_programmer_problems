describe Cheater do
  describe "#match?" do
    context "most frequent letter count greater than words without guessed letter" do
      it "returns true" do
        cheater = Cheater.new(word_set: Set.new(["apple", "airplane"]), winning_word: "apple")

        result = cheater.match?("a")

        expect(result).to be true
      end
    end

    context "words without guessed letter greater than most frequent letter count" do
      it "returns false" do
        cheater = Cheater.new(word_set: Set.new(["apple", "orange"]), winning_word: "apple")

        result = cheater.match?("z")

        expect(result).to be false
      end
    end
  end
end
