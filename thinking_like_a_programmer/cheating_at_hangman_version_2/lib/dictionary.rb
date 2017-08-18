class Dictionary
  attr_reader :words

  def initialize(words)
    @words = remove_words_with_special_characters(words)
  end

  private

  def remove_words_with_special_characters(words)
    words.select do |word|
      word.match(/^[a-zA-Z]+$/)
    end
  end
end
