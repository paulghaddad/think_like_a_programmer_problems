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

def remove_words_of_wrong_length(list, acceptable_length)

end

word_list = read_word_file("word_list.txt")

letter = "a"
puts "\nCount of words without the letter #{letter}:"
puts count_words_without_letter(word_list, letter)
