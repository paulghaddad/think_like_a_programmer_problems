require 'pry'

class StudentGradeAnalyzer
  attr_reader :students, :number_of_students, :grades

  def initialize(students:)
    @students = students.sort_by(&:grade)
    @number_of_students = students.size
    @grades = @students.map(&:grade)
  end

  def median_grade
    median(grades)
  end

  def first_quartile_grade
    if number_of_students.odd?
      median(grades[0...number_of_students/2 - 1])
    else
      median(grades[0...number_of_students/2])
    end
  end

  def third_quartile_grade
    if number_of_students.odd?
      median(grades[number_of_students/2 - 1...number_of_students])
    else
      median(grades[number_of_students/2...number_of_students])
    end
  end

  private

  def median(data_points)
    num_data_points = data_points.size

    if number_of_students.odd?
      data_points[num_data_points / 2 - 1]
    else
      (data_points[num_data_points / 2 - 1] + data_points[num_data_points / 2]) / 2.0
    end
  end
end
