class FirstStudentPolicy
  HIGHER_GRADE = :higher_grade
  LOWER_STUDENT_NUMBER = :lower_student_number
  NAME_COMES_FIRST = :name_comes_first

  attr_reader :policy, :student_record_1, :student_record_2

  def initialize(policy:, student_record_1:, student_record_2:)
    @policy = policy
    @student_record_1 = student_record_1
    @student_record_2 = student_record_2
  end

  def sort
    case policy
    when :higher_grade
      higher_grade
    when :lower_student_number
      lower_student_number
    when :name_comes_first
      name_comes_first
    else
      raise InvalidFirstStudentPolicyError.new("#{policy} is not a valid policy")
    end
  end

  private

  def higher_grade
    student_record_1.numeric_grade > student_record_2.numeric_grade
  end

  def lower_student_number
    student_record_1.id < student_record_2.id
  end

  def name_comes_first
    student_record_1.name < student_record_2.name
  end
end

class InvalidFirstStudentPolicyError < StandardError
  def initialize(message)
    super(message)
  end
end
