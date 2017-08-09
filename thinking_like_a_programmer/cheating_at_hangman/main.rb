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
  binding.pry
  list.each do |word|
    puts word
  end
end

word_list = read_word_file("word_list.txt")
display_word_list(word_list)
