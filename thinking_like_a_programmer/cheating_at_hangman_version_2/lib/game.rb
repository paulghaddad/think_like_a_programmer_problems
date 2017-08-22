require 'pry'

class Game
  attr_reader :possible_words, :misses, :discovered_letter_count, :word_length, :hidden_word, :revealed_word, :status, :max_misses
  DEFAULT_MAX_MISSES = 8

  def initialize(words:, word_length:, max_misses: DEFAULT_MAX_MISSES)
    @word_length = word_length
    @possible_words = filter_words_by_length(words, word_length)
    @misses = 0
    @discovered_letter_count = 0
    @hidden_word = select_hidden_word
    @revealed_word = "*" * word_length
    @max_misses = max_misses
    @status = :in_progress
  end

  def guess_letter(letter)
    hidden_word.each_char.with_index do |char, index|
      if char == letter
        @revealed_word[index] = char
        @discovered_letter_count += 1
      end
    end

    unless hidden_word.match(letter)
      @misses += 1
    end

    update_game_status
  end

  private

    def filter_words_by_length(words, word_length)
      words.select { |word| word.length == word_length }
    end

    def select_hidden_word
      possible_words.sample
    end

    def update_game_status
      if revealed_word == hidden_word
        @status = :won
      elsif misses == max_misses
        @status = :lost
      end
    end
end
