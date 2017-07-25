require "./student_node"
require "./first_student_policy"
require 'pry'

class StudentCollection
  attr_accessor :policy

  def initialize(policy: :name_comes_first)
    @list_head = nil
    @policy = policy
  end

  def each
    c = @list_head

    until c == nil
      yield(c.student_data)
      c = c.next
    end
    self
  end

  def add_record(new_student)
    new_node = StudentNode.new(new_student)
    new_node.next = @list_head
    @list_head = new_node
  end

  def record_with_number(id_num)
    loop_pointer = @list_head

    while loop_pointer && loop_pointer.student_data.id != id_num
      loop_pointer = loop_pointer.next
    end

    if loop_pointer.nil?
      dummy_record = StudentRecord.new(grade: -1, id: -1, name: "")
      return dummy_record
    else
      loop_pointer.student_data
    end
  end

  def all_records
    loop_pointer = @list_head

    records = []

    while loop_pointer
      records << loop_pointer.student_data
      loop_pointer = loop_pointer.next
    end

    records
  end

  def number_of_records
    all_records.size
  end

  def remove_record(id_num)
    loop_pointer = @list_head
    trailing = nil

    while loop_pointer && loop_pointer.student_data.id != id_num
      trailing = loop_pointer
      loop_pointer = loop_pointer.next
    end

    return if loop_pointer.nil?

    @list_head = list_head.next if trailing.nil?

    trailing.next = loop_pointer.next
  end

  def average_grade
    students = self.to_enum
    num_students = 0
    sum = 0.0

    loop do
      current_student = students.next
      sum += current_student.numeric_grade
      num_students += 1
    end

    sum / num_students
  end

  def records_within_range(low_grade:, high_grade:)
    loop_pointer = @list_head

    students_within_range = []

    while loop_pointer
      student_record = loop_pointer.student_data
      if (low_grade..high_grade).cover?(student_record.numeric_grade)
        students_within_range << loop_pointer.student_data
      end
      loop_pointer = loop_pointer.next
    end

    students_within_range
  end

  def first_student
    loop_pointer = @list_head
    highest_sorted_student = loop_pointer.student_data

    while loop_pointer.next
      student_record = loop_pointer.student_data
      next_student_record = loop_pointer.next.student_data
      sorter_policy = FirstStudentPolicy.new(policy: policy,
                                             student_record_1: student_record,
                                             student_record_2: next_student_record)

      unless sorter_policy.sort
        highest_sorted_student = next_student_record
      end

      loop_pointer = loop_pointer.next
    end

    highest_sorted_student
  end
end
