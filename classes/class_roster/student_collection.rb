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

  class StudentNode
    attr_reader :student_data
    attr_accessor :next

    def initialize(student_data)
      @student_data = student_data
      @next = nil
    end
  end
end
