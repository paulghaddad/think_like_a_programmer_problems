require "./student_record_decorator" 
class EnrollmentYearStudentRecord < StudentRecordDecorator
  attr_reader :enrollment_year

  def initialize(real_student, enrollment_year:)
    @real_student = real_student
    @enrollment_year = enrollment_year
  end
end
