require "./6_4"

describe "Greatest Common Denominator" do
  describe "#gcd" do
    it "calculates the greatest common denominator between two numbers" do
      number_1 = 3768
      number_2= 1701

      greatest_common_denominator = GreatestCommonDenoninator.calculate(number_1, number_2)

      expect(greatest_common_denominator).to eq(3)
    end

    it "calculates the greatest common denominator between two numbers" do
      number_1 = 1
      number_2= 5

      greatest_common_denominator = GreatestCommonDenoninator.calculate(number_1, number_2)

      expect(greatest_common_denominator).to eq(1)
    end

    it "calculates the greatest common denominator between two numbers" do
      number_1 = 10
      number_2= 100

      greatest_common_denominator = GreatestCommonDenoninator.calculate(number_1, number_2)

      expect(greatest_common_denominator).to eq(10)
    end

    it "calculates the greatest common denominator between two numbers" do
      number_1 = 22
      number_2= 131

      greatest_common_denominator = GreatestCommonDenoninator.calculate(number_1, number_2)

      expect(greatest_common_denominator).to eq(1)
    end
  end
end
