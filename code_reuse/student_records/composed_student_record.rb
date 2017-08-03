require "./student_record_decorator"

class TermPaperStudentRecord < StudentRecordDecorator
  attr_reader :term_paper_title

  def initialize(real_student, term_paper_title:)
    @real_student = real_student
    @term_paper_title = term_paper_title
  end
end
