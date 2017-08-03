require "./term_paper_student_record"
require "./student_record"

describe TermPaperStudentRecord do
  describe "#term_paper_title" do
    it "adds a term paper title attribute to a student record" do
      decorated_student = TermPaperStudentRecord.new(StudentRecord.new(grade: 90, id: 1, name: "Bob"), term_paper_title: "My new term paper")

      expect(decorated_student).to have_attributes(numeric_grade: 90,
                                         id: 1,
                                         name: "Bob",
                                         term_paper_title: "My new term paper")
    end
  end
end
