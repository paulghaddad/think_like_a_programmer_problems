require 'pry'
require 'set'

word_list = Set.new

File.open("word_list.txt") do |f|
  f.each do |word|
    unless word.match("\'")
      word_list << word.gsub("\n", "")
    end
  end
end

