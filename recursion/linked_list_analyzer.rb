class LinkedListAnalyzer
  def self.negative_number_count(list_head)
    return 0 if list_head.nil?

    list_count = negative_number_count(list_head.next)

    if list_head.value.negative?
      list_count += 1
    end

    list_count
  end
end
