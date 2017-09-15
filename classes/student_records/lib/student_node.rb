class StudentNode
  attr_reader :student_data
  attr_accessor :next

  def initialize(student_data)
    @student_data = student_data
    @next = nil
  end
end
