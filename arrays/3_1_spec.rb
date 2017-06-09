require "./3_1"

describe QSort do
  Student = Struct.new(:grade, :student_id, :name)

  describe "#sort_array" do
    it "sorts an array of integers" do
      unsorted_array = [3, 1, 2]
      comparison_function = Proc.new { |a, b| a - b }

      sorted_array = QSort.sort_array(unsorted_array, comparison_function)

      expect(sorted_array).to eq [1, 2, 3]
    end
  end

  describe "#sort_struct" do
    context "sort by grade" do
      it "sorts on the student's grade" do
        student_1 = Student.new(12, 10, "Tim")
        student_2 = Student.new(1, 2, "Adam")
        student_3 = Student.new(8, 6, "Mike")

        sorted_struct = QSort.sort_struct(collection: [student_1, student_2, student_3], sort_by_attribute: :grade)

        expect(sorted_struct).to eq [student_2, student_3, student_1]
      end
    end

    context "sort by student id" do
      it "sorts on the student's id" do
        student_1 = Student.new(12, 10, "Tim")
        student_2 = Student.new(1, 2, "Adam")
        student_3 = Student.new(8, 6, "Mike")

        sorted_struct = QSort.sort_struct(collection: [student_1, student_2, student_3], sort_by_attribute: :student_id)

        expect(sorted_struct).to eq [student_2, student_3, student_1]
      end
    end

    context "sort by name" do
      it "sorts on the student's name" do
        student_1 = Student.new(12, 10, "Tim")
        student_2 = Student.new(1, 2, "Adam")
        student_3 = Student.new(8, 6, "Mike")

        sorted_struct = QSort.sort_struct(collection: [student_1, student_2, student_3], sort_by_attribute: :name)

        expect(sorted_struct).to eq [student_2, student_3, student_1]
      end
    end
  end
end
