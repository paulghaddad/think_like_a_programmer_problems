require "./grade"

class StudentRecord
  attr_accessor :id, :name
  attr_reader :numeric_grade

  def initialize(grade: 0, id: -1, name:)
    grade = Grade.new(grade)
    @numeric_grade = grade.numeric_grade
    @id = id
    @name = name
  end

  def to_s
    "Student Name: %s. Student ID: %s. Student Grade: %s" % [name, id, numeric_grade]
  end
end
