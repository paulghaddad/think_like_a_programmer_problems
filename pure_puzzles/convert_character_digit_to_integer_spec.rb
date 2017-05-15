require "./ascii_converter"

describe "Convert character digit to integer" do
  describe "#char_to_i" do
    it "converts a character from 0 to 9 to an integer" do
      characters = [*"0".."9"]

      conversions = characters.map do
        |char| AsciiConverter.convert_to_integer(character: char)
      end

      expect(conversions).to eq([*0..9])
    end
  end
end
