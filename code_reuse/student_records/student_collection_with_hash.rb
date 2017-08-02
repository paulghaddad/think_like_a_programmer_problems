require "./student_node"
require 'pry'

class StudentCollectionWithHash
  attr_reader :students

  def initialize
    @students = Hash.new
  end

  def add_record(new_student)
    @students[new_student.id] = new_student
  end

  def student_count
    students.count
  end

  def average_grade
    num_students = 0
    sum = 0.0

    students.each do |student_id, student|
      sum += student.numeric_grade
      num_students += 1
    end

    sum / num_students
  end

  def find(student_id)
    students.fetch(student_id, -1)
  end
end
