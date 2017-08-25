class Cheater
  attr_reader :word_set, :winning_word

  def initialize(word_set:, winning_word:)
    @word_set = word_set
    @winning_word = winning_word
  end

  def match?(letter)
    most_frequent_letter_count = patterns_by_count(letter).values.max
    words_without_letter_count = words_without_letter(letter).size

    most_frequent_letter_count > words_without_letter_count
  end

  def remove_words_matching_most_frequent_pattern(letter)
    most_frequent_pattern = most_frequent_pattern_by_letter(letter)

    word_set.inject(Set.new) do |updated_word_set, word|
      if matches_pattern?(most_frequent_pattern, word, letter)
        updated_word_set << word
      else
        updated_word_set
      end
    end
  end

  private

    def words_without_letter(letter)
      word_set.reject { |word| word.match(letter) }
    end

    def patterns_by_count(letter)
      word_length = word_set.first.length
      patterns = ["t", "f"].repeated_permutation(word_length).to_a.select { |pattern| pattern.include?("t") }

      pattern_count = patterns.inject({}) do |count, permutation|
        count[permutation.join.to_sym] = 0
        count
      end

      pattern_count.each do |pattern, count|
        pattern_count[pattern] = word_count_matching_pattern(pattern, letter)
      end

      pattern_count
    end

    def word_count_matching_pattern(pattern, letter)
      count = 0

      word_set.each do |word|
        if matches_pattern?(pattern, word, letter)
          count += 1
        else
          count
        end
      end

      count
    end

    def matches_pattern?(pattern, word, letter)
      match = true

      pattern.to_s.each_char.with_index do |char, index|
        if char == "t"
          match = word[index] == letter
        else
          match = word[index] != letter
        end

        break unless match
      end

      match
    end

    def most_frequent_pattern_by_letter(letter)
      patterns_by_count(letter).max_by { |_pattern, count| count }.first
    end
end
