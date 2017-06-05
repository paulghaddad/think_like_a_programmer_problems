require "./number_system_converter"

describe NumberSystemConverter do
  context "positive digit" do
    it "converts from binary to decimal" do
      binary_number = 11000
      converter = NumberSystemConverter.new(number: binary_number, base: 2)

      decimal_number = converter.to_decimal

      expect(decimal_number).to eq(24)
    end

    it "converts from decimal to binary" do
      decimal_number = 24
      converter = NumberSystemConverter.new(number: decimal_number, base: 10)

      binary_number = converter.to_binary

      expect(binary_number).to eq(11000)
    end
  end

  context "negative digit" do
    it "converts from binary to decimal" do
      binary_number = -11000
      converter = NumberSystemConverter.new(number: binary_number, base: 2)

      decimal_number = converter.to_decimal

      expect(decimal_number).to eq(-24)
    end

    it "converts from decimal to binary" do
      decimal_number = -24
      converter = NumberSystemConverter.new(number: decimal_number, base: 10)

      binary_number = converter.to_binary

      expect(binary_number).to eq(-11000)
    end
  end

  context "One" do
    it "converts from binary to decimal" do
      binary_number = 1
      converter = NumberSystemConverter.new(number: binary_number, base: 2)

      decimal_number = converter.to_decimal

      expect(decimal_number).to eq(1)
    end

    it "converts from decimal to binary" do
      decimal_number = 1
      converter = NumberSystemConverter.new(number: decimal_number, base: 10)

      binary_number = converter.to_binary

      expect(binary_number).to eq(1)
    end
  end

  context "Zero" do
    it "converts from binary to decimal" do
      binary_number = 0
      converter = NumberSystemConverter.new(number: binary_number, base: 2)

      decimal_number = converter.to_decimal

      expect(decimal_number).to eq(0)
    end

    it "converts from decimal to binary" do
      decimal_number = 0
      converter = NumberSystemConverter.new(number: decimal_number, base: 10)

      binary_number = converter.to_binary

      expect(binary_number).to eq(0)
    end
  end
end
