require "./student_collection"
require "./student_record"
require 'pry'

describe StudentCollection do
  describe "#initialize" do
    context "first student policy not provided" do
      it "sets the names_comes_first_policy by default" do
        student_collection = StudentCollection.new 
        expect(student_collection).to have_attributes(policy: :name_comes_first)
      end
    end

    context "first student policy provided" do
      it "sets the first student policy" do
        student_collection = StudentCollection.new(policy: :higher_grade)

        expect(student_collection).to have_attributes(policy: :higher_grade)
      end
    end
  end

  describe "#add_record" do
    it "adds a single record to the collection" do
      student = StudentRecord.new(grade: 90, id: 1575, name: "Steve")
      student_collection = StudentCollection.new

      student_collection.add_record(student)

      expect(student_collection.all_records).to contain_exactly(student)
    end
  end

  describe "#record_with_number" do
    it "finds the record matching the id" do
      student_1 = StudentRecord.new(grade: 90, id: 1575, name: "Steve")
      student_2 = StudentRecord.new(grade: 95, id: 1576, name: "Bob")
      student_collection = build_student_collection(student_1, student_2)

      matching_student = student_collection.record_with_number(1575)

      expect(matching_student).to eq(student_1)
    end
  end

  describe "#all_records" do
    it "returns all student records in the collection" do
      student_1 = StudentRecord.new(grade: 90, id: 1575, name: "Steve")
      student_2 = StudentRecord.new(grade: 95, id: 1576, name: "Bob")
      student_collection = build_student_collection(student_1, student_2)

      student_records = student_collection.all_records

      expect(student_records).to contain_exactly(student_1, student_2)
    end
  end

  describe "#number_of_records" do
    it "returns the size of the collection" do
      student_1 = StudentRecord.new(grade: 90, id: 1575, name: "Steve")
      student_2 = StudentRecord.new(grade: 95, id: 1576, name: "Bob")
      student_collection = build_student_collection(student_1, student_2)

      number_of_records = student_collection.number_of_records

      expect(number_of_records).to eq(2)
    end
  end

  describe "#remove_record" do
    it "removes the record with the id from the collection" do
      student_1 = StudentRecord.new(grade: 90, id: 1575, name: "Steve")
      student_2 = StudentRecord.new(grade: 95, id: 1576, name: "Bob")
      student_collection = build_student_collection(student_1, student_2)

      student_collection.remove_record(1575)

      expect(student_collection.all_records).to contain_exactly(student_2)
    end
  end

  describe "#records_within_range" do
    it "returns the students with grades within a range" do
      student_1 = StudentRecord.new(grade: 100, id: 1575, name: "Steve")
      student_2 = StudentRecord.new(grade: 80, id: 1576, name: "Bob")
      student_collection = build_student_collection(student_1, student_2)

      students = student_collection.records_within_range(low_grade: 90, high_grade: 100)

      expect(students).to contain_exactly(student_1)
    end
  end

  describe "#student_first" do
    context "no policy set" do
      it "uses the default policy to determine the first student" do
        student_1 = StudentRecord.new(grade: 85, id: 1575, name: "Chris")
        student_2 = StudentRecord.new(grade: 100, id: 1576, name: "Bob")
        student_3 = StudentRecord.new(grade: 90, id: 1577, name: "Adam")
        student_collection = build_student_collection(student_1, student_2, student_3)

        highest_sorted_student = student_collection.first_student

        expect(highest_sorted_student).to eq(student_3)
      end
    end

    context "policy is set" do
      it "uses the specified policy to determine the first student" do
        student_1 = StudentRecord.new(grade: 85, id: 1575, name: "Chris")
        student_2 = StudentRecord.new(grade: 100, id: 1576, name: "Bob")
        student_3 = StudentRecord.new(grade: 90, id: 1577, name: "Adam")
        student_collection = build_student_collection(student_1, student_2, student_3)
        student_collection.policy = :higher_grade

        student_with_highest_grade = student_collection.first_student

        expect(student_with_highest_grade).to eq(student_2)
      end
    end
  end

  describe "#average_grade" do
    it "averages the student's grades" do
      student_1 = StudentRecord.new(grade: 94, id: 1575, name: "Chris")
      student_2 = StudentRecord.new(grade: 100, id: 1576, name: "Bob")
      student_3 = StudentRecord.new(grade: 90, id: 1577, name: "Adam")
      student_collection = build_student_collection(student_1, student_2, student_3)

      average_grade = student_collection.average_grade

      expect(average_grade).to be_within(0.1).of(94.6)
    end
  end

  private

  def build_student_collection(*students)
    students.inject(StudentCollection.new) do |student_collection, student|
      student_collection.add_record(student)
      student_collection
    end
  end
end
