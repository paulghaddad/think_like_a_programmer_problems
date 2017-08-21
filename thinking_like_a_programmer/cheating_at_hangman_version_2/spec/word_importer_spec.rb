describe WordImporter do
  describe ".import" do
    it "imports all words from a file" do
      file_path = File.join(File.dirname(__FILE__), "fixtures", "word_test_file.txt")

      words = WordImporter.import(file_path)

      expect(words).to contain_exactly("apple", "orange")
    end
  end
end
