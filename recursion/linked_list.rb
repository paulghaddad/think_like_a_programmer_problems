class LinkedListNode
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end
end

# a = LinkedListNode.new(5)
# b = LinkedListNode.new(1)
# c = LinkedListNode.new(9)
#
# a.next = b
# b.next = c
