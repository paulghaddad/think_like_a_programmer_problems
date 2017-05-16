require "./variable_length_luhn_validator"

describe "Luhn Checksum Validation - Variable Length" do
  context "even length" do
    context "valid" do
      it "returns true" do
        number = "176278\n"
        validator = VariableLengthLuhnValidator.new(input_number: number)

        expect(validator.valid?).to be true
      end
    end

    context "invalid" do
      it "returns false" do
        number = "176248\n"
        validator = VariableLengthLuhnValidator.new(input_number: number)

        expect(validator.valid?).to be false
      end
    end
  end

  context "odd length" do
    context "valid" do
      it "returns true" do
        number = "7222824\n"
        validator = VariableLengthLuhnValidator.new(input_number: number)

        expect(validator.valid?).to be true
      end
    end

    context "invalid" do
      it "returns false" do
        number = "7222834\n"
        validator = VariableLengthLuhnValidator.new(input_number: number)

        expect(validator.valid?).to be false
      end
    end
  end
end
