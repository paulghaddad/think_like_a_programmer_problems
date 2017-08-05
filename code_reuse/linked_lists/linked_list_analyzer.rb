require 'pry'

class LinkedListAnalyzer
  attr_reader :head

  def initialize(linked_list)
    @head = linked_list.head
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

  def sum_of_positive_numbers
    sum_of_positive_numbers_recursive(head)
  end

  def odd_parity?
    odd_bits_count(head).odd?
  end

  def count(element:)
    element_count(node: head, element: element)
  end

  def largest_number
    largest_number_recursive(head)
  end

  private

  def negative_numbers(node)
    return 0 if node.nil?

    list_count = negative_numbers(node.next)

    if node.value.negative?
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

  def sum_of_positive_numbers_recursive(node)
    return 0 if node.nil?

    sum_of_positives = sum_of_positive_numbers_recursive(node.next)
    node_value = node.value

    if node_value.positive?
      sum_of_positives += node_value
    end

    sum_of_positives
  end

  def odd_bits_count(node)
    return 0 if node.nil?

    sum_of_odd_bits = odd_bits_count(node.next)

    if node.value.odd?
      sum_of_odd_bits += 1
    end

    sum_of_odd_bits
  end

  def element_count(node:, element:)
    return 0 if node.nil?

    number_of_hits = element_count(node: node.next, element: element)

    target_element_match = node.value == element

    if target_element_match
      number_of_hits += 1
    else
      number_of_hits
    end
  end

  def largest_number_recursive(node)
    return node.value if node.next.nil?

    largest_element = largest_number_recursive(node.next)
    current_element = node.value

    if current_element > largest_element
      current_element
    else
      largest_element
    end
  end
end
