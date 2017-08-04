require "./grade"

class StudentRecordWithAnyAttribute
  attr_accessor :id, :name
  attr_reader :numeric_grade

  def initialize(grade: 0, id: -1, name:)
    grade = Grade.new(grade)
    @numeric_grade = grade.numeric_grade
    @id = id
    @name = name
  end

  def add_extra_field(attribute, value)
    attr_methods = %Q{
      def #{attribute}
        @#{attribute}
      end

      def #{attribute}=(val)
        @#{attribute} = val
      end
    }

    self.class.class_eval(attr_methods)
    self.send("#{attribute}=", value)
  end

  def retrieve_field(attribute)
    self.instance_variable_get("@#{attribute}")
  end

  def to_s
    "Student Name: %s. Student ID: %s. Student Grade: %s" % [name, id, numeric_grade]
  end
end
