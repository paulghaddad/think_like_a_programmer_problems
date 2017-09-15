require_relative "../lib/grade"

describe Grade do
  describe "#initialize" do
    context "valid grade" do
      it "has a numerical grade attribute" do
        grade = Grade.new(90)

        expect(grade).to have_attributes(numeric_grade: 90)
      end
    end

    context "invalid grade" do
      it "raises an Invalid Grade Error" do
        expect do
          Grade.new(-1)
        end.to raise_error(InvalidGradeError)
      end
    end
  end

  describe "#letter_grade" do
    it "has a corresponding letter grade" do
      grade = Grade.new(90)

      letter_grade = grade.letter_grade

      expect(letter_grade).to eq("A-")
    end
  end
end
