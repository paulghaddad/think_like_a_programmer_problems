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
    it "outputs the revealed word so far" do
      dictionary = Set.new(["apple"])
      game = Game.new(words: dictionary, word_length: 5)

      expect { game.guess_letter("a") }.
        to output { "Word guessed so far: a****" }.to_stdout
    end

    it "outputs the guessed letters" do
      dictionary = Set.new(["apple"])
      game = Game.new(words: dictionary, word_length: 5)

      game.guess_letter("z")
      game.guess_letter("y")
      # expect { game.guess_letter("z") }.
      #   to output { "Letters guessed so far: z" }.to_stdout
    end

    context "guess correct" do 
      it "increments the discovered letter count" do
        dictionary = Set.new(["apple"])
        game = Game.new(words: dictionary, word_length: 5)

        expect { game.guess_letter("a") }.
          to change { game.discovered_letter_count }.from(0).to(1)
      end

      it "does not increment the misses count" do
        dictionary = Set.new(["apple"])
        game = Game.new(words: dictionary, word_length: 5)

        expect { game.guess_letter("a") }.
          to_not change { game.misses }
      end

      it "reveals a letter" do
        dictionary = Set.new(["apple"])
        game = Game.new(words: dictionary, word_length: 5)

        game.guess_letter("a")

        expect(game.revealed_word).to eq("a****")
      end
    end

    context "guess incorrect" do
      it "increments the misses count" do
        dictionary = Set.new(["apple"])
        game = Game.new(words: dictionary, word_length: 5)

        expect { game.guess_letter("z") }.
          to change { game.misses }.from(0).to(1)
      end

      it "does not increment the discovered letter count" do
        dictionary = Set.new(["apple"])
        game = Game.new(words: dictionary, word_length: 5)

        expect { game.guess_letter("z") }.
          to_not change { game.discovered_letter_count }
      end

      it "removes words matching the letter from the possible words" do
        dictionary = Set.new(["apple", "zebra"])
        game = Game.new(words: dictionary, word_length: 5)

        game.guess_letter("z")

        expect(game.possible_words).to contain_exactly("apple")
      end
    end
  end

  describe "#status" do
    context "word not guessed and under max misses limit" do
      it "has a status of in_progress" do
        dictionary = Set.new(["apple"])
        game = Game.new(words: dictionary, word_length: 5, max_misses: 2)

        game.guess_letter("a")

        expect(game.status).to eq(:in_progress)
      end
    end

    context "word guessed" do
      it "has a status of won" do
        dictionary = Set.new(["a"])
        game = Game.new(words: dictionary, word_length: 1, max_misses: 2)

        game.guess_letter("a")

        expect(game.status).to eq(:won)
      end
    end

    context "max misses limit exceeded" do
      it "has a status of lost" do
        dictionary = Set.new(["apple"])
        game = Game.new(words: dictionary, word_length: 5, max_misses: 1)

        game.guess_letter("z")

        expect(game.status).to eq(:lost)
      end
    end
  end

  private

  def dictionary
    Set.new(["apple", "prune", "orange"])
  end
end
