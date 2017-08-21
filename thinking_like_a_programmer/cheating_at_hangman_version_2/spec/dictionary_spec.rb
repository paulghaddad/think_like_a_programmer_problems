describe Dictionary do
  describe "#words" do
    it "is a collection of words without special characters" do
      imported_words = ["apple", "orange", "hello!", "owner's"]

      dictionary = Dictionary.new(imported_words)

      expect(dictionary.words).to contain_exactly("apple", "orange")
    end
  end
end
