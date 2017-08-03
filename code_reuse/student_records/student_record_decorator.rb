require "forwardable"

class StudentRecordDecorator
  extend Forwardable

  def_delegators :@real_student, :numeric_grade, :id, :name, :term_paper_title, :auditing, :enrollment_year

  def initialize(real_student)
    @real_student = real_student
  end
end
