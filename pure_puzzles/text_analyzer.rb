class TextAnalyzer
  attr_reader :text

  WORD_BREAKS = [" ", ".", ","]
  SENTENCE_BREAKS = ["."]
  VOWELS = ["a", "e", "i", "o", "u"]

  def initialize(text: )
    @text = text
  end

  def word_count
    number_of_words = 0

    text.each_char.with_index do |character, index|
      next_character = text[index + 1]

      if word_break?(character, next_character)
        number_of_words += 1
      end
    end

    number_of_words
  end

  def vowel_count
    vowel_count = 0

    text.each_char do |character|
      if vowel?(character)
        vowel_count += 1
      end
    end

    vowel_count
  end

  def sentence_count
    sentence_count = 0

    text.each_char do |character|
      if sentence_break?(character)
        sentence_count += 1
      end
    end

    sentence_count
  end

  private

  def word_break?(character, subsequent_character)
    WORD_BREAKS.include?(character) && !WORD_BREAKS.include?(subsequent_character)
  end

  def vowel?(character)
    VOWELS.include?(character)
  end

  def sentence_break?(character)
    SENTENCE_BREAKS.include?(character)
  end
end
