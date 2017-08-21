describe Game do
  describe "#initialize" do
    it "is initialized with game parameters" do
      game = Game.new(words: dictionary, word_length: 8)

      expect(game).to have_attributes(misses: 0,
                                      discovered_letter_count: 0,
                                      word_length: 8)
    end

    it "creates a word set containing words of the chosen length" do
      dictionary = Set.new(["apple", "orange", "watermelon"])
      game = Game.new(words: dictionary, word_length: 10)

      possible_words = game.possible_words

      expect(possible_words).to contain_exactly("watermelon")
    end

    it "randomly chooses a word of the chosen length" do
      game = Game.new(words: dictionary, word_length: 5)

      expect(game.hidden_word.length).to eq(5)
    end

    it "hides the letters of the revealed word" do
      game = Game.new(words: dictionary, word_length: 5)

      expect(game.revealed_word).to eq("*****")
    end
  end

  describe "#guess" do
    context "guess correct" do 
      it "increments the discovered letter count" do
        dictionary = Set.new(["apple"])
        game = Game.new(words: dictionary, word_length: 5)

        expect { game.guess_letter("a") }.
          to change { game.discovered_letter_count }.from(0).to(1)
      end

      it "reveals a letter" do

      end
    end

    context "guess incorrect" do

    end
  end

  describe "#status" do
    context "word not guessed and under max misses limit" do
      it "has a status of in_progress" do
      end
    end

    context "word guessed" do

    end

    context "max misses limit exceeded" do

    end
  end

  private

  def dictionary
    Set.new(["apple", "prune", "orange"])
  end
end
