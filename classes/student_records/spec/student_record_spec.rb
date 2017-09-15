require_relative "../lib/student_record"

describe StudentRecord do
  describe "#initialize" do
    context "all attributes are set" do
      it "sets the student's grade, id and name" do
        student = StudentRecord.new(grade: 90, id: 1, name: "Bob")

        expect(student).to have_attributes(numeric_grade: 90,
                                           id: 1,
                                           name: "Bob")
      end

      context "id is not set" do
        it "defaults to -1" do
          student = StudentRecord.new(grade: 90, name: "Bob")

          expect(student.id).to eq(-1)
        end
      end

    end
  end

  describe "#to_s" do
    it "pretty prints information about the student" do
      student = StudentRecord.new(grade: 90, id: 1, name: "Bob")

      expect { puts student }.to output(/Student Name: Bob. Student ID: 1. Student Grade: 90/).to_stdout
    end
  end
end
