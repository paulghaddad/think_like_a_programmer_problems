require "./6_2"

describe "Problem 6.2" do
  describe "#bool?" do
    context "binary string with odd parity" do
      it "returns true" do
        binary_string = "01000110"

        expect(BinaryStringAnalyzer.bool?(binary_string)).to be true
      end
    end

    context "binary string with even parity" do
      it "returns false" do
        binary_string = "01000010"

        expect(BinaryStringAnalyzer.bool?(binary_string)).to be false
      end
    end
  end
end
