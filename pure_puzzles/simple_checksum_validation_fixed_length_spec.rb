require "./simple_checksum_validation_fixed_length"

describe "Simple Checksum Validation - Fixed Length" do
  context "valid" do
    it "returns true" do
      number = "222211"
      validator = SimpleChecksumValidation.new(input_number: number)

      expect(validator.valid?).to be true
    end
  end

  context "invalid" do
    it "returns false" do
      number = "222222"
      validator = SimpleChecksumValidation.new(input_number: number)

      expect(validator.valid?).to be false
    end
  end
end
