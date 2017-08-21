require "set"

class WordImporter
  def self.import(path)
    word_list = Set.new

    File.open(path) do |f|
      f.each do |word|
        word_list << word.chomp
      end
    end

    word_list
  end
end
