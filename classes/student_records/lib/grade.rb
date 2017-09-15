require_relative "invalid_grade_error"

class Grade
  NUMBER_CATEGORIES = 11
  GRADE_LETTER = ["F", "D", "D+", "C-", "C", "C+", "B-", "B", "B+", "A-", "A"]
  LOWEST_GRADE_SCORE = [0, 60, 67, 70, 73, 77, 80, 83, 87, 90, 93]

  attr_reader :numeric_grade

  def initialize(grade)
    raise InvalidGradeError unless valid_grade?(grade)
    @numeric_grade = grade
  end

  def letter_grade
    category = 0
    while category < NUMBER_CATEGORIES && LOWEST_GRADE_SCORE[category] <= numeric_grade
      category += 1
    end

    GRADE_LETTER[category - 1]
  end

  private

  def valid_grade?(grade)
    grade >= 0 && grade <= 100
  end
end
