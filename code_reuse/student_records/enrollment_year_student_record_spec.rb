require "./enrollment_year_student_record"
require "./student_record"

describe EnrollmentYearStudentRecord do
  describe "#enrollment_year" do
    it "adds an enrollment year attribute to a student record" do
      decorated_student = EnrollmentYearStudentRecord.new(StudentRecord.new(grade: 90, id: 1, name: "Bob"), enrollment_year: 2017)

      expect(decorated_student).to have_attributes(numeric_grade: 90,
                                                   id: 1,
                                                   name: "Bob",
                                                   enrollment_year: 2017)
    end
  end
end
