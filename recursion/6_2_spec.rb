require "./6_2"

describe "Problem 6.2" do
  describe "#odd_parity_1?" do
    context "binary string with odd parity" do
      it "returns true" do
        binary_string = "01000110"

        expect(BinaryStringAnalyzer.odd_parity_1?(binary_string)).to be true
      end
    end

    context "binary string with even parity" do
      it "returns false" do
        binary_string = "01000010"

        expect(BinaryStringAnalyzer.odd_parity_1?(binary_string)).to be false
      end
    end
  end

  describe "#odd_parity_2?" do
    context "binary string with odd parity" do
      it "returns true" do
        binary_string = "01000110"

        expect(BinaryStringAnalyzer.odd_parity_2?(binary_string)).to be true
      end
    end

    context "binary string with even parity" do
      it "returns false" do
        binary_string = "01000010"

        expect(BinaryStringAnalyzer.odd_parity_2?(binary_string)).to be false
      end
    end
  end

  describe "#odd_count" do
    context "binary string with odd parity" do
      it "returns count of odd digits" do
        binary_string = "01000110"

        expect(BinaryStringAnalyzer.odd_count(binary_string)).to eq(3)
      end
    end

    context "binary string with even parity" do
      it "returns count of odd digits" do
        binary_string = "01000010"

        expect(BinaryStringAnalyzer.odd_count(binary_string)).to eq(2)
      end
    end
  end
end
