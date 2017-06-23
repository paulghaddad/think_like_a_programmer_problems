class StudentRecord
  class InvalidGradeError < ArgumentError
    def new
      super("Grades must be between 0 and 100")
    end
  end

  NUMBER_CATEGORIES = 11
  GRADE_LETTER = ["F", "D", "D+", "C-", "C", "C+", "B-", "B", "B+", "A-", "A"]
  LOWEST_GRADE_SCORE = [0, 60, 67, 70, 73, 77, 80, 83, 87, 90, 93]

  attr_accessor :id, :name
  attr_reader :grade

  def initialize(grade: 0, id: -1, name:)
    set_grade(grade)
    @id = id
    @name = name
  end

  def set_grade(grade)
    raise InvalidGradeError unless valid_grade?(grade)
    @grade = grade
  end

  def letter_grade
    raise InvalidGradeError unless valid_grade?(grade)
    category = 0
    while category < NUMBER_CATEGORIES && LOWEST_GRADE_SCORE[category] <= grade
      category += 1
    end

    GRADE_LETTER[category - 1]
  end

  private

  def valid_grade?(grade)
    grade >= 0 && grade <= 100
  end
end
