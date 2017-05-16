require "./luhn_checksum_validator"

describe "Luhn Checksum Validation" do
  context "valid" do
    it "returns true" do
      number = "331"
      validator = LuhnChecksum.new(input_number: number)

      expect(validator.valid?).to be true
    end
  end

  context "invalid" do
    it "returns false" do
      number = "123"
      validator = LuhnChecksum.new(input_number: number)

      expect(validator.valid?).to eq false
    end

    context "doubled digit has two digits" do
      it "returns true" do
        number = "282"
        validator = LuhnChecksum.new(input_number: number)

        expect(validator.valid?).to be false
      end
    end
  end
end
