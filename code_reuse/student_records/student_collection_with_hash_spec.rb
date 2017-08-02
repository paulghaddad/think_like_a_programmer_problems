require "./student_collection_hash"
require "./student_record"

describe StudentCollectionHash do
  describe "#add_record" do
    it "adds a single record to the collection" do
      student = StudentRecord.new(grade: 90, id: 1575, name: "Steve")
      student_collection = StudentCollectionHash.new

      student_collection.add_record(student)

      expect(student_collection.students).to include(1575 => student)
    end
  end

  describe "#student_count" do
    it "returns the number of students" do
      student_1 = StudentRecord.new(grade: 94, id: 1575, name: "Chris")
      student_2 = StudentRecord.new(grade: 100, id: 1576, name: "Bob")
      student_3 = StudentRecord.new(grade: 90, id: 1577, name: "Adam")
      student_collection = build_student_collection(student_1, student_2, student_3)

      average_grade = student_collection.student_count

      expect(average_grade).to eq(3)
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

  describe "#search_by_student_id" do
    context "student number present" do
      it "returns the student's position in the student collection" do
        student_1 = StudentRecord.new(grade: 94, id: 1575, name: "Chris")
        student_2 = StudentRecord.new(grade: 100, id: 1574, name: "Bob")
        student_3 = StudentRecord.new(grade: 90, id: 1577, name: "Adam")
        student_collection = build_student_collection(student_1, student_2, student_3)

        position = student_collection.find(1574)

        expect(position).to eq(student_2)
      end
    end

    context "student number not present" do
      it "returns -1" do
        student_1 = StudentRecord.new(grade: 94, id: 1575, name: "Chris")
        student_2 = StudentRecord.new(grade: 100, id: 1574, name: "Bob")
        student_3 = StudentRecord.new(grade: 90, id: 1577, name: "Adam")
        student_collection = build_student_collection(student_1, student_2, student_3)

        position = student_collection.find(1)

        expect(position).to eq(-1)
      end
    end
  end

  private

  def build_student_collection(*students, **options)
    students.inject(StudentCollectionHash.new) do |student_collection, student|
      student_collection.add_record(student)
      student_collection
    end
  end
end
