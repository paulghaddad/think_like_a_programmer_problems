require "./student_collection"
require "./student_record"

describe StudentCollection do
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

  describe "#average_grade" do
    it "calculates the average student numeric grade" do
      student_1 = StudentRecord.new(grade: 100, id: 1575, name: "Steve")
      student_2 = StudentRecord.new(grade: 90, id: 1576, name: "Bob")
      student_collection = build_student_collection(student_1, student_2)

      average_grade = student_collection.average_grade

      expect(average_grade).to eq(95.0)
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

  private

  def build_student_collection(*students)
    students.inject(StudentCollection.new) do |student_collection, student|
      student_collection.add_record(student)
      student_collection
    end
  end
end
