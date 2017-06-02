require "./2_6"

describe "Problem 2.6: Decimal/Binary Number Converter" do
  context "positive digit" do
    it "converts from decimal to binary" do
      decimal_number = 24

      binary_number = BinaryDecimalConverter.to_binary(decimal_number)

      expect(binary_number).to eq(11000)
    end

    it "converts from binary to decimal" do
      binary_number = 11000

      decimal_number = BinaryDecimalConverter.to_decimal(binary_number)

      expect(decimal_number).to eq(24)
    end
  end

  context "negative digit" do
    it "converts from decimal to binary" do
      decimal_number = -24

      binary_number = BinaryDecimalConverter.to_binary(decimal_number)

      expect(binary_number).to eq(-11000)
    end

    it "converts from binary to decimal" do
      binary_number = -11000

      decimal_number = BinaryDecimalConverter.to_decimal(binary_number)

      expect(decimal_number).to eq(-24)
    end
  end

  context "One" do
    it "converts from decimal to binary" do
      decimal_number = 1

      binary_number = BinaryDecimalConverter.to_binary(decimal_number)

      expect(binary_number).to eq(1)
    end

    it "converts from binary to decimal" do
      binary_number = 1

      decimal_number = BinaryDecimalConverter.to_decimal(binary_number)

      expect(decimal_number).to eq(1)
    end
  end

  context "Zero" do
    it "converts from decimal to binary" do
      decimal_number = 0

      binary_number = BinaryDecimalConverter.to_binary(decimal_number)

      expect(binary_number).to eq(0)
    end

    it "converts from binary to decimal" do
      binary_number = 0

      decimal_number = BinaryDecimalConverter.to_decimal(binary_number)

      expect(decimal_number).to eq(0)
    end
  end
end
