require "./number_system_converter"

describe NumberSystemConverter do
  context "positive digit" do
    it "converts from binary to decimal" do
      binary_number = 11000
      converter = NumberSystemConverter.new(number: binary_number, base: 2)

      decimal_number = converter.to_decimal

      expect(decimal_number).to eq("24")
    end

    it "converts from hex to decimal" do
      hex_number = "7E"
      converter = NumberSystemConverter.new(number: hex_number, base: 16)

      decimal_number = converter.to_decimal

      expect(decimal_number).to eq("126")
    end

    it "converts from decimal to binary" do
      decimal_number = 24
      converter = NumberSystemConverter.new(number: decimal_number, base: 10)

      binary_number = converter.to_base(2)

      expect(binary_number).to eq("11000")
    end

    it "converts from hexadecimal to binary" do
      hex_number = "7E"
      converter = NumberSystemConverter.new(number: hex_number, base: 16)

      binary_number = converter.to_base(2)

      expect(binary_number).to eq("1111110")
    end

    it "converts from binary to hexadecimal" do
      binary_number = 1111110
      converter = NumberSystemConverter.new(number: binary_number, base: 2)

      binary_number = converter.to_base(16)

      expect(binary_number).to eq("7E")
    end
  end

  context "negative digit" do
    it "converts from binary to decimal" do
      binary_number = -11000
      converter = NumberSystemConverter.new(number: binary_number, base: 2)

      decimal_number = converter.to_decimal

      expect(decimal_number).to eq("-24")
    end

    it "converts from hex to decimal" do
      hex_number = "-7E"
      converter = NumberSystemConverter.new(number: hex_number, base: 16)

      decimal_number = converter.to_decimal

      expect(decimal_number).to eq("-126")
    end

    it "converts from decimal to binary" do
      decimal_number = -24
      converter = NumberSystemConverter.new(number: decimal_number, base: 10)

      binary_number = converter.to_base(2)

      expect(binary_number).to eq("-11000")
    end
  end

  context "One" do
    it "converts from binary to decimal" do
      binary_number = 1
      converter = NumberSystemConverter.new(number: binary_number, base: 2)

      decimal_number = converter.to_decimal

      expect(decimal_number).to eq("1")
    end

    it "converts from decimal to binary" do
      decimal_number = 1
      converter = NumberSystemConverter.new(number: decimal_number, base: 10)

      binary_number = converter.to_base(2)

      expect(binary_number).to eq("1")
    end
  end

  context "Zero" do
    it "converts from binary to decimal" do
      binary_number = 0
      converter = NumberSystemConverter.new(number: binary_number, base: 2)

      decimal_number = converter.to_decimal

      expect(decimal_number).to eq("0")
    end

    it "converts from decimal to binary" do
      decimal_number = 0
      converter = NumberSystemConverter.new(number: decimal_number, base: 10)

      binary_number = converter.to_base(2)

      expect(binary_number).to eq("0")
    end
  end
end
