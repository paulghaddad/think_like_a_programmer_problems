class InvalidGradeError < ArgumentError
  def new
    super("Grades must be between 0 and 100")
  end
end
