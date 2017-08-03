require "./student_record_decorator"

class AuditStudentRecord < StudentRecordDecorator
  attr_reader :auditing

  def initialize(real_student, auditing:)
    @real_student = real_student
    @auditing = auditing
  end
end
