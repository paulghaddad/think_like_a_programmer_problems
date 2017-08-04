require "./student_record_with_any_attribute"
require 'pry'

describe StudentRecordWithAnyAttribute do
  describe "#initialize" do
    context "all attributes are set" do
      it "sets the student's grade, id and name" do
        student = StudentRecordWithAnyAttribute.new(grade: 90, id: 1, name: "Bob")

        expect(student).to have_attributes(numeric_grade: 90,
                                           id: 1,
                                           name: "Bob")
      end

      context "id is not set" do
        it "defaults to -1" do
          student = StudentRecordWithAnyAttribute.new(grade: 90, name: "Bob")

          expect(student.id).to eq(-1)
        end
      end

    end
  end

  describe "#add_extra_field" do
    it "sets a new attribute on the student record" do
      student = StudentRecordWithAnyAttribute.new(grade: 90, id: 1, name: "Bob")

      student.add_extra_field(:age, 25)

      expect(student).to have_attributes(numeric_grade: 90,
                                         id: 1,
                                         name: "Bob",
                                         age: 25)
    end
  end

  describe "#retrieve_field"do 
    it "returns the value of the extra field" do
      student = StudentRecordWithAnyAttribute.new(grade: 90, id: 1, name: "Bob")

      student.add_extra_field(:age, 25)

      expect(student.retrieve_field(:age)).to eq(25)
    end
  end

  describe "#to_s" do
    it "pretty prints information about the student" do
      student = StudentRecordWithAnyAttribute.new(grade: 90, id: 1, name: "Bob")

      expect { puts student }.to output(/Student Name: Bob. Student ID: 1. Student Grade: 90/).to_stdout
    end
  end
end
