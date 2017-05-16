require "./fixed_length_luhn_validator"

describe "Luhn Checksum Validation - Fixed Length" do
  context "valid" do
    it "returns true" do
      number = "176278"
      validator = FixedLengthLuhnValidator.new(input_number: number)

      expect(validator.valid?).to be true
    end
  end

  context "invalid" do
    it "returns false" do
      number = "176248"
      validator = FixedLengthLuhnValidator.new(input_number: number)

      expect(validator.valid?).to be false
    end
  end
end
