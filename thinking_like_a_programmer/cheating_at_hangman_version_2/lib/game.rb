require 'pry'

class Game
  attr_reader :possible_words, :misses, :discovered_letter_count, :word_length, :hidden_word, :revealed_word, :status, :max_misses, :cheater
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
    @cheater = build_cheater
  end

  def guess_letter(letter)
    if cheater.match?(letter)
      @discovered_letter_count += 1
      update_revealed_word(letter)
    else
      @misses += 1
    end

    update_game_status
    puts "Word guessed so far: #{revealed_word}"
  end

  private

    def build_cheater
      Cheater.new(word_set: possible_words, winning_word: hidden_word)
    end

    def filter_words_by_length(words, word_length)
      words.select { |word| word.length == word_length }
    end

    def select_hidden_word
      possible_words.sample
    end

    def update_revealed_word(letter)
      hidden_word.each_char.with_index do |char, index|
        if char == letter
          @revealed_word[index] = char
        end
      end
    end

    def update_game_status
      if revealed_word == hidden_word
        @status = :won
      elsif misses == max_misses
        @status = :lost
      end
    end
end
