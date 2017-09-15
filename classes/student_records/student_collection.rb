require "./student_node"

class StudentCollection
  def initialize
    @list_head = nil
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
    loop_pointer = @list_head

    number_of_records = 0
    sum_of_grades = 0.0
    while loop_pointer
      number_of_records += 1
      sum_of_grades += loop_pointer.student_data.numeric_grade
      loop_pointer = loop_pointer.next
    end

    (sum_of_grades / number_of_records).round(2)
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
end
