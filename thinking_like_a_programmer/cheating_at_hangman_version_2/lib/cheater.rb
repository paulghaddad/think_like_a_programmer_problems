require 'pry'
class Cheater
  attr_reader :word_set, :winning_word

  def initialize(word_set:, winning_word:)
    @word_set = word_set
    @winning_word = winning_word
  end

  def match?(letter)
    words_without_letter_count = words_without_letter(letter).size
    most_frequent_letter_count = 1

    most_frequent_letter_count > words_without_letter_count
  end

  private

    def words_without_letter(letter)
      word_set.reject { |word| word.match(letter) }
    end
end
