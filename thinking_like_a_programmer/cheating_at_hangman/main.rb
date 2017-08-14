require 'pry'
require 'set'


def read_word_file(path)
  word_list = Set.new

  File.open(path) do |f|
    f.each do |word|
      unless word.match("\'")
        word_list << word.gsub("\n", "")
      end
    end
  end

  word_list
end

def display_word_list(list)
  list.each do |word|
    puts word
  end
end

def count_words_without_letter(list, letter)
  list.inject(0) do |count, word|
    if word.match(/#{letter}/)
      count
    else
      count += 1
    end
  end
end

def remove_words_of_wrong_length!(list, acceptable_length)
  list.select! { |word| word.length == acceptable_length }
end

def number_in_pattern?(pattern, number)
  pattern.any? { |pattern_number| pattern_number == number }
end

def matches_pattern?(word, letter, pattern)
  word.each_char.with_index do |char, index|
    if char == letter
      if !number_in_pattern?(pattern, index)
        return false
      end
    else
      if number_in_pattern?(pattern, index)
        return false
      end
    end
  end

  return true
end

def remove_words_without_letter!(list, required_letter)
  list.select! { |word| word.match(required_letter) }
end

def remove_words_with_letter!(list, forbidden_letter)
  list.reject! { |word| word.match(forbidden_letter) }
end

def count_of_words_matching_pattern(list, letter, pattern)
  count = 0

  list.each do |word|
    if matches_pattern?(word, letter, pattern)
      count += 1
      list.delete(word)
    end
  end

  count
end

def most_freq_pattern_by_letter(list, letter)
  remove_words_without_letter!(list, letter)
  max_pattern_count = 0
  max_pattern = Set.new

  list.each do |word|
    current_pattern = Set.new

    word.each_char.with_index do |char, index|
      if char == letter
        current_pattern << index
      end
    end

    list.delete(word)

    current_pattern_count = 1 + count_of_words_matching_pattern(list, letter, current_pattern)

    if current_pattern_count > max_pattern_count
      max_pattern_count = current_pattern_count
      max_pattern = current_pattern
    end
  end

  return max_pattern, max_pattern_count
end

word_list = read_word_file("word_list.txt")

letter = "a"
puts "\nCount of words without the letter #{letter}:"
puts count_words_without_letter(word_list, letter)

acceptable_length = 4
remove_words_of_wrong_length!(word_list, acceptable_length)

# remove_words_with_letter!(word_list, "a")

# remove_words_without_letter!(word_list, "a")

# pattern_1 = Set.new([1, 3, 4])
# puts number_in_pattern?(pattern_1, 4)
#
# pattern_2 = Set.new([1])
# puts matches_pattern?("world", "o", pattern_2)
#
# pattern_3 = Set.new([1])
# puts matches_pattern?("world", "w", pattern_3)
#
# pattern_4 = Set.new([1])
# puts matches_pattern?("woorld", "o", pattern_4)

most_common_pattern = most_freq_pattern_by_letter(word_list, "a")
puts most_common_pattern.first.inspect
puts most_common_pattern.last

