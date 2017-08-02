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

  def all_records
    students.sort_by(&:id)
  end

  def student_count
    students.count
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

  # Using Interpolation Search Algorithm
  def find(student_id)
    low = 0
    high = student_count - 1

    while (low <= high && student_id >= all_records[low].id && student_id <= all_records[high].id)
      position = low + ( (student_id - all_records[low].id) * (high - low) / (all_records[high].id - all_records[low].id))

      if all_records[position].id == student_id
        return position
      elsif all_records[position].id < student_id
        low = position + 1
      else
        high = position - 1
      end
    end

    # student id not found
    return -1
  end
end
