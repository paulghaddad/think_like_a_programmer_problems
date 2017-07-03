require "./linked_list"
require "./linked_list_analyzer"

describe LinkedListAnalyzer do
  describe "#negative_number_count" do
    it "counts the number of negative numbers in a linked list" do
      a = LinkedListNode.new(-4)
      b = LinkedListNode.new(1)
      c = LinkedListNode.new(-9)

      a.next = b
      b.next = c

      expect(LinkedListAnalyzer.negative_number_count(a)).to eq(2)
    end
  end
end
