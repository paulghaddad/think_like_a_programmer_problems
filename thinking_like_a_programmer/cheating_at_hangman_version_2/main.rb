require "./lib/word_importer"
require "./lib/dictionary"
require "./lib/game"
require 'pry'

word_set_path = File.join(File.dirname(__FILE__), "word_list.txt")
imported_words = WordImporter.import(word_set_path)

dictionary = Dictionary.new(imported_words)

print "Enter the word length to play with: "
word_length = gets.chomp.to_i

game = Game.new(words: dictionary.words, word_length: word_length)

while game.status == :in_progress
  print "Letter to guess: "
  guessed_letter = gets.chomp.downcase

  game.guess_letter(guessed_letter)
end

if game.status == :won
  puts "Congratulations! You won. The word was #{game.hidden_word}"
elsif game.status == :lost
  puts "Sorry, you lost. The word was #{game.hidden_word}"
end
