require 'pry'

class LinkedList
  attr_reader :head

  def initialize(head:)
    @head = head
  end

  def negative_number_count
    negative_numbers(head)
  end

  def values_in_order
    values_in_order_recursive(head)
  end

  def values_in_reverse_order
    values_in_reverse_order_recursive(head)
  end

  private

  def negative_numbers(list_head)
    return 0 if list_head.nil?

    list_count = negative_numbers(list_head.next)

    if list_head.value.negative?
      list_count += 1
    end

    list_count
  end

  def values_in_order_recursive(node)
    return if node.nil?
    puts node.value

    values_in_order_recursive(node.next)
  end

  def values_in_reverse_order_recursive(node)
    return if node.nil?
    values_in_reverse_order_recursive(node.next)

    puts node.value
  end
end
