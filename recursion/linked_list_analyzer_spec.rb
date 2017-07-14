require "./linked_list_node"
require "./linked_list"
require "./linked_list_analyzer"
require 'pry'

describe LinkedListAnalyzer do
  describe "#negative_number_count" do
    it "counts the number of negative numbers in a linked list" do
      linked_list = build_linked_list(-4, 1, -9)
      linked_list_analyzer = LinkedListAnalyzer.new(linked_list)

      negative_number_count = linked_list_analyzer.negative_number_count

      expect(negative_number_count).to eq(2)
    end
  end

  describe "#values_in_order" do
    it "gives the value of a linked list's nodes from top to bottom" do
      linked_list = build_linked_list(-4, 1, -9)
      linked_list_analyzer = LinkedListAnalyzer.new(linked_list)

      expect { linked_list_analyzer.values_in_order }.to output(/-4/).to_stdout
      expect { linked_list_analyzer.values_in_order }.to output(/1/).to_stdout
      expect { linked_list_analyzer.values_in_order }.to output(/-9/).to_stdout
    end
  end

  describe "#values_in_reverse_order" do
    it "gives the value of a linked list's nodes from bottom to top" do
      linked_list = build_linked_list(-4, 1, -9)
      linked_list_analyzer = LinkedListAnalyzer.new(linked_list)

      expect { linked_list_analyzer.values_in_reverse_order }.to output(/-4/).to_stdout
      expect { linked_list_analyzer.values_in_reverse_order }.to output(/1/).to_stdout
      expect { linked_list_analyzer.values_in_reverse_order }.to output(/-9/).to_stdout
    end
  end

  describe "#sum_of_positive numbers" do
    it "sums the positive elements in a linked list" do
      linked_list = build_linked_list(1, 2, 3, -4)
      linked_list_analyzer = LinkedListAnalyzer.new(linked_list)

      sum = linked_list_analyzer.sum_of_positive_numbers

      expect(sum).to eq(6)
    end
  end

  private

  def build_linked_list(*node_values)
    linked_list_nodes = node_values.inject([]) do |nodes, value|
      nodes << LinkedListNode.new(value)
    end

    for node_index in (0..linked_list_nodes.size - 2)
      linked_list_nodes[node_index].next = linked_list_nodes[node_index + 1]
    end

    LinkedList.new(head: linked_list_nodes.first)
  end
end
