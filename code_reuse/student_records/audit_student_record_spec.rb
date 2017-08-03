require "./audit_student_record"
require "./student_record"

describe AuditStudentRecord do
  describe "#auditing" do
    it "adds an auditing attribute to a student record" do
      decorated_student = AuditStudentRecord.new(StudentRecord.new(grade: 90, id: 1, name: "Bob"), auditing: true)

      expect(decorated_student).to have_attributes(numeric_grade: 90,
                                                   id: 1,
                                                   name: "Bob",
                                                   auditing: true)
    end
  end
end
