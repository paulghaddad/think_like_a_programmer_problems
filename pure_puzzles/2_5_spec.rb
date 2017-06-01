require "./2_5"

describe "Problem 2-5 - ISBN 13 digit validation" do
  context "valid" do
    it "returns true" do
      isbn_validator = ISBNValidator.new(number: 9780306406157)

      expect(isbn_validator.valid?).to be true
    end
  end

  context "invalid" do
    it "returns false" do
      isbn_validator = ISBNValidator.new(number: 9780306406156)

      expect(isbn_validator.valid?).to be false
    end
  end
end
