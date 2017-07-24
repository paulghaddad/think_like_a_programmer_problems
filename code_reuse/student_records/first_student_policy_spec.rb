require "./first_student_policy"
require "./student_record"

describe FirstStudentPolicy do
  describe "higher grade policy" do
    context "student 1 has a higher grade than student 2" do
      it "returns true" do
        student_1 = StudentRecord.new(grade: 95, name: "Joe")
        student_2 = StudentRecord.new(grade: 90, name: "Bob")

        policy = FirstStudentPolicy.new(policy: :higher_grade, student_record_1: student_1, student_record_2: student_2)

        expect(policy.sort).to be true
      end
    end

    context "student 1 has a lower grade than student 2" do
      it "returns false" do
        student_1 = StudentRecord.new(grade: 85, name: "Joe")
        student_2 = StudentRecord.new(grade: 90, name: "Bob")

        policy = FirstStudentPolicy.new(policy: :higher_grade, student_record_1: student_1, student_record_2: student_2)

        expect(policy.sort).to be false
      end
    end
  end

  describe "lower student number policy" do
    context "student 1 has a lower student number than student 2" do
      it "returns true" do
        student_1 = StudentRecord.new(name: "Joe", id: 1)
        student_2 = StudentRecord.new(name: "Bob", id: 2)

        policy = FirstStudentPolicy.new(policy: :lower_student_number, student_record_1: student_1, student_record_2: student_2)

        expect(policy.sort).to be true
      end
    end

    context "student 1 has a higher student number than student 2" do
      it "returns false" do
        student_1 = StudentRecord.new(name: "Joe", id: 2)
        student_2 = StudentRecord.new(name: "Bob", id: 1)

        policy = FirstStudentPolicy.new(policy: :lower_student_number, student_record_1: student_1, student_record_2: student_2)

        expect(policy.sort).to be false
      end
    end
  end

  describe "name comes first policy" do
    context "student 1's name comes first alphabetically" do
      it "returns true" do
        student_1 = StudentRecord.new(name: "Adam")
        student_2 = StudentRecord.new(name: "Bob")

        policy = FirstStudentPolicy.new(policy: :name_comes_first, student_record_1: student_1, student_record_2: student_2)

        expect(policy.sort).to be true
      end
    end

    context "student 1's name comes first alphabetically" do
      it "returns false" do
        student_1 = StudentRecord.new(name: "Joe")
        student_2 = StudentRecord.new(name: "Bob")

        policy = FirstStudentPolicy.new(policy: :name_comes_first, student_record_1: student_1, student_record_2: student_2)

        expect(policy.sort).to be false
      end
    end
  end

  context "Invalid policy" do
    it "raises an InvalidFirstStudentPolicyException" do
      student_1 = StudentRecord.new(name: "Joe")
      student_2 = StudentRecord.new(name: "Bob")

      expect { FirstStudentPolicy.new(policy: :unknown, student_record_1: student_1, student_record_2: student_2).sort }.to raise_error(InvalidFirstStudentPolicyError)
    end
  end
end
