require "./linked_list_node"
require "./linked_list"
require "./linked_list_analyzer"

describe LinkedListAnalyzer do
  describe "#negative_number_count" do
    it "counts the number of negative numbers in a linked list" do
      linked_list_analyzer = build_linked_list_analyzer(-4, 1, -9)

      negative_number_count = linked_list_analyzer.negative_number_count

      expect(negative_number_count).to eq(2)
    end
  end

  describe "#values_in_order" do
    it "gives the value of a linked list's nodes from top to bottom" do
      linked_list_analyzer = build_linked_list_analyzer(-4, 1, -9)

      expect { linked_list_analyzer.values_in_order }.to output(/-4/).to_stdout
      expect { linked_list_analyzer.values_in_order }.to output(/1/).to_stdout
      expect { linked_list_analyzer.values_in_order }.to output(/-9/).to_stdout
    end
  end

  describe "#values_in_reverse_order" do
    it "gives the value of a linked list's nodes from bottom to top" do
      linked_list_analyzer = build_linked_list_analyzer(-4, 1, -9)

      expect { linked_list_analyzer.values_in_reverse_order }.to output(/-4/).to_stdout
      expect { linked_list_analyzer.values_in_reverse_order }.to output(/1/).to_stdout
      expect { linked_list_analyzer.values_in_reverse_order }.to output(/-9/).to_stdout
    end
  end

  describe "#sum_of_positive numbers" do
    it "sums the positive elements in a linked list" do
      linked_list_analyzer = build_linked_list_analyzer(1, 2, 3, -4)

      sum = linked_list_analyzer.sum_of_positive_numbers

      expect(sum).to eq(6)
    end
  end

  describe "#odd_parity?" do
    context "binary string with odd parity" do
      it "returns true" do
        linked_list_analyzer = build_linked_list_analyzer(0, 1, 0, 0, 0, 1, 1, 0)

        expect(linked_list_analyzer.odd_parity?).to be true
      end
    end

    context "binary string with even parity" do
      it "returns false" do
        linked_list_analyzer = build_linked_list_analyzer(0, 1, 0, 0, 1, 1, 1, 0)

        expect(linked_list_analyzer.odd_parity?).to be false
      end
    end
  end

  describe "#count_of_element" do
    it "returns the number of times the element appears in the linked list" do
      linked_list_analyzer = build_linked_list_analyzer(1, 2, 1, -4, 0, 1)

      count = linked_list_analyzer.count(element: 1)

      expect(count).to eq(3)
    end
  end

  describe "#largest_number" do
    it "returns the largest number in the linked list" do
      linked_list_analyzer = build_linked_list_analyzer(1, 2, 1, 8, 0, 1)

      largest_number = linked_list_analyzer.largest_number

      expect(largest_number).to eq(8)
    end
  end

  private

  def build_linked_list_analyzer(*node_values)
    linked_list_nodes = node_values.inject([]) do |nodes, value|
      nodes << LinkedListNode.new(value)
    end

    for node_index in (0..linked_list_nodes.size - 2)
      linked_list_nodes[node_index].next = linked_list_nodes[node_index + 1]
    end

    linked_list = LinkedList.new(head: linked_list_nodes.first)
    LinkedListAnalyzer.new(linked_list)
  end
end
