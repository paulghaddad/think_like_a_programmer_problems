require "./3_8"

describe StudentGradeAnalyzer do
  Student = Struct.new(:grade, :student_id, :name)

  describe "#median_grade" do
    it "calculates the median student grade" do
      grade_analyzer = StudentGradeAnalyzer.new(students: students)

      expect(grade_analyzer.median_grade).to eq(6.5)
    end
  end

  describe "#first_quartile_grade" do
    it "calculates the first quartile grade" do
      grade_analyzer = StudentGradeAnalyzer.new(students: students)

      expect(grade_analyzer.first_quartile_grade).to eq(2.5)
    end
  end

  describe "#third_quartile_grade" do
    it "calculates the third quartile grade" do
      grade_analyzer = StudentGradeAnalyzer.new(students: students)

      expect(grade_analyzer.third_quartile_grade).to eq(17)
    end
  end

  private

  def students
    [
      Student.new(5, 4 ,"David"),
      Student.new(1, 1 ,"Adam"),
      Student.new(8, 5 ,"Ed"),
      Student.new(13, 6 ,"Fred"),
      Student.new(2, 2 ,"Bob"),
      Student.new(21, 7 ,"Greg"),
      Student.new(3, 3 ,"Chris"),
      Student.new(34, 8, "Henry")
    ]
  end
end
