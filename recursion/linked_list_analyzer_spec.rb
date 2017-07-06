require "./linked_list_node"
require "./linked_list"

describe LinkedList do
  describe "#negative_number_count" do
    it "counts the number of negative numbers in a linked list" do
      a = LinkedListNode.new(-4)
      b = LinkedListNode.new(1)
      c = LinkedListNode.new(-9)
      a.next = b
      b.next = c
      linked_list = LinkedList.new(head: a)

      negative_number_count = linked_list.negative_number_count

      expect(negative_number_count).to eq(2)
    end
  end

  describe "#values_in_order" do
    it "gives the value of a linked list's nodes from top to bottom" do
      a = LinkedListNode.new(-4)
      b = LinkedListNode.new(1)
      c = LinkedListNode.new(-9)
      a.next = b
      b.next = c
      linked_list = LinkedList.new(head: a)

      expect { linked_list.values_in_order }.to output(/-4/).to_stdout
      expect { linked_list.values_in_order }.to output(/1/).to_stdout
      expect { linked_list.values_in_order }.to output(/-9/).to_stdout
    end
  end

  describe "#values_in_reverse_order" do
    it "gives the value of a linked list's nodes from bottom to top" do
      a = LinkedListNode.new(-4)
      b = LinkedListNode.new(1)
      c = LinkedListNode.new(-9)
      a.next = b
      b.next = c
      linked_list = LinkedList.new(head: a)

      expect { linked_list.values_in_reverse_order }.to output(/-4/).to_stdout
      expect { linked_list.values_in_reverse_order }.to output(/1/).to_stdout
      expect { linked_list.values_in_reverse_order }.to output(/-9/).to_stdout
    end
  end
end
