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
  temp_list = list.dup
  remove_words_without_letter!(temp_list, letter)
  max_pattern_count = 0
  max_pattern = Set.new

  temp_list.each do |word|
    current_pattern = Set.new

    word.each_char.with_index do |char, index|
      if char == letter
        current_pattern << index
      end
    end

    temp_list.delete(word)

    current_pattern_count = 1 + count_of_words_matching_pattern(temp_list, letter, current_pattern)

    if current_pattern_count > max_pattern_count
      max_pattern_count = current_pattern_count
      max_pattern = current_pattern
    end
  end

  return max_pattern, max_pattern_count
end

def display_guessed_letters(letters)
  puts "Letters guessed: "

  letters.each.with_index do |letter, index|
    if letter
      puts (index + "a".ord).chr
    end
  end
end

def reduce_by_pattern(list, letter, pattern)
  new_list = []

  list.each do |word|
    new_list << word if matches_pattern?(word, letter, pattern)
  end

  new_list
end

WORD_LENGTH = 8.freeze
MAX_MISSES = 9.freeze

def main
  word_list = read_word_file("word_list.txt")
  misses = 0
  discovered_letter_count = 0
  remove_words_of_wrong_length!(word_list, WORD_LENGTH)
  revealed_word = "*" * WORD_LENGTH
  guessed_letters = Array.new(26, false)
  # next_letter
  puts "Word so far: #{revealed_word}"

  while (discovered_letter_count < WORD_LENGTH && misses < MAX_MISSES)
    print "Letter to guess: "
    next_letter = gets.chomp.downcase
    guessed_letters[next_letter.ord - "a".ord] = true
    missing_count = count_words_without_letter(word_list, next_letter)

    next_pattern, next_pattern_count = most_freq_pattern_by_letter(word_list, next_letter)

    if missing_count > next_pattern_count
      puts "Missed!"
      remove_words_with_letter!(word_list, next_letter)
      misses += 1
    else
      puts "Discovered letter"

      next_pattern.each do |place|
        discovered_letter_count += 1
        revealed_word[place] = next_letter
      end

      word_list = reduce_by_pattern(word_list, next_letter, next_pattern)
    end

    puts "Word so far: #{revealed_word}"
    display_guessed_letters(guessed_letters)
  end

  if misses == MAX_MISSES
    puts "Sorry. You lost. The word I was thinking of was #{word_list.sample}."
  else
    puts "Great job. You win. Word was #{revealed_word}."
  end
end

main

# letter = "a"
# puts "\nCount of words without the letter #{letter}:"
# puts count_words_without_letter(word_list, letter)
#
# acceptable_length = 4
# remove_words_of_wrong_length!(word_list, acceptable_length)

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

# most_common_pattern = most_freq_pattern_by_letter(word_list, "a")
# puts most_common_pattern.first.inspect
# puts most_common_pattern.last
#
# letters = Array.new(26, false)
# letters[2] = true
# letters[4] = true
#
# display_guessed_letters(letters)
