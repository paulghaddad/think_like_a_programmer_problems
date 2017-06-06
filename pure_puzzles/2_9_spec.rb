require "./text_analyzer"

describe "Problem 2-9 - Text Statistics Analyzer" do
  describe "#word_count" do
    it "returns the number of words" do
      analyzer = TextAnalyzer.new(text: sample_text)

      expect(analyzer.word_count).to eq(41)
    end
  end

  describe "#vowel_count" do
    it "returns the number of vowels" do
      analyzer = TextAnalyzer.new(text: sample_text)

      expect(analyzer.vowel_count).to eq(77)
    end
  end

  describe "#sentence_count" do
    it "returns the number of sentences" do
      analyzer = TextAnalyzer.new(text: sample_text)

      expect(analyzer.sentence_count).to eq(3)
    end
  end

  private

  def sample_text
    <<~SAMPLE_TEXT
    Learning to build a modern web application is daunting. Ruby on Rails makes it much easier and more fun. It includes everything you need to build fantastic applications, and you can learn it with the support of our large, friendly community.
    SAMPLE_TEXT
  end
end
