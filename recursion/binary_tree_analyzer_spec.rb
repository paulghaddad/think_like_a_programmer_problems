require "./binary_tree_node"
require "./binary_tree_analyzer"

describe BinaryTreeAnalyzer do
  describe "#largest_node" do
    it "returns the largest leaf value" do
      a = BinaryTreeNode.new(1)
      b = BinaryTreeNode.new(4)
      c = BinaryTreeNode.new(-2)
      a.left = b
      a.right = c

      largest_node_value = BinaryTreeAnalyzer.largest_node(a)

      expect(largest_node_value).to eq(4)
    end
  end
end
