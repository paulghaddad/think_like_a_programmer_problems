require "./string_manipulator"

describe StringManipulator do
  describe "#append" do
    it "adds a single to the end of another string" do
      original_string = "he"
      string_manipulator = StringManipulator.new(original_string)

      appended_string = string_manipulator.append("y")

      expect(appended_string).to eq("hey")
    end
  end

  describe "#concatenate" do
    it "appends the characters of one string to the end of another" do
      original_string = "Ruby"
      string_manipulator = StringManipulator.new(original_string)

      concatenated_string = string_manipulator.concatenate("OnRails")

      expect(concatenated_string).to eq("RubyOnRails")
    end
  end

  describe "#character_at" do
    context "valid position" do
      it "returns the character at the specified position in the string" do
        string = "Ruby On Rails"
        string_manipulator = StringManipulator.new(string)

        eighth_character = string_manipulator.character_at(8)

        expect(eighth_character).to eq("R")
      end
    end

    context "invalid position" do
      it "an ArgumentError is raised" do
        string = "Ruby On Rails"
        string_manipulator = StringManipulator.new(string)

        expect { string_manipulator.character_at(13) }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#[]" do
    it "returns the character at the specified position in the string" do
      string = "Ruby On Rails"
      string_manipulator = StringManipulator.new(string)

      eighth_character = string_manipulator[8]

      expect(eighth_character).to eq("R")
    end
  end

  describe "#remove" do
    context "valid parameters" do
      it "removes the specified number of characters from the string from the starting position" do
        string = "Ruby On Rails"
        string_manipulator = StringManipulator.new(string)

        modified_string = string_manipulator.remove(8, 4)

        expect(modified_string).to eq("Ruby On s")
      end
    end

    context "invalid parameters" do
      context "invalid starting position" do
        it "an Argument Error is raised" do
          string = "Ruby On Rails"
          string_manipulator = StringManipulator.new(string)

          expect { string_manipulator.remove(13, 4) }.to raise_error(ArgumentError)
        end
      end

      context "invalid number of characters to remove" do
        it "only removes the characters to the end of the string" do
          string = "Ruby On Rails"
          string_manipulator = StringManipulator.new(string)

          modified_string = string_manipulator.remove(9, 10)

          expect(modified_string).to eq("Ruby On R")
        end
      end
    end
  end
end

