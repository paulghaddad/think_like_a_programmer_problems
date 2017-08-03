require "./term_paper_student_record"
require "./enrollment_year_student_record"
require "./audit_student_record"

require "./student_record"

describe "Composed student record" do
  it "has a term paper, enrollment year and audit flag" do
    decorated_student = AuditStudentRecord.new(EnrollmentYearStudentRecord.new(TermPaperStudentRecord.new(
                            StudentRecord.new(grade: 90, id: 1, name: "Bob"),
                            term_paper_title: "My new term paper"),
                          enrollment_year: 2017),
                        auditing: true)

    expect(decorated_student).to have_attributes(numeric_grade: 90,
                                        id: 1,
                                        name: "Bob",
                                        term_paper_title: "My new term paper",
                                        enrollment_year: 2017,
                                        auditing: true)
  end
end
