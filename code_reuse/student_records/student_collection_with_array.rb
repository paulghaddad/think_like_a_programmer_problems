require "./student_node"
require 'pry'

class StudentCollectionWithArray
  attr_reader :students

  def initialize
    @students = []
  end

  def add_record(new_student)
    @students << new_student
  end

  def average_grade
    num_students = 0
    sum = 0.0

    students.each do |student|
      sum += student.numeric_grade
      num_students += 1
    end

    sum / num_students
  end

  alias_method :all_records, :students
end
