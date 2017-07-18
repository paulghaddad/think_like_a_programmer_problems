require "./binary_tree_node"
require "./binary_tree"
require "./binary_tree_analyzer"
require 'pry'

describe BinaryTreeAnalyzer do
  describe "#largest_node" do
    it "returns the largest leaf value" do
      a = BinaryTreeNode.new(1)
      b = BinaryTreeNode.new(4)
      c = BinaryTreeNode.new(-2)
      a.left = b
      a.right = c
      binary_tree = BinaryTree.new(root: a)
      binary_tree_analyzer = BinaryTreeAnalyzer.new(binary_tree)

      largest_node_value = binary_tree_analyzer.largest_node

      expect(largest_node_value).to eq(4)
    end
  end

  describe "#number_of_leaves" do
    it "returns the number of leaves in the binary tree" do
      a = BinaryTreeNode.new(1)
      b = BinaryTreeNode.new(4)
      c = BinaryTreeNode.new(-2)
      a.left = b
      a.right = c
      binary_tree = BinaryTree.new(root: a)
      binary_tree_analyzer = BinaryTreeAnalyzer.new(binary_tree)

      number_of_leaves = binary_tree_analyzer.number_of_leaves

      expect(number_of_leaves).to eq(2)
    end
  end

  describe "heap?" do
    context "is a heap" do
      it "returns true" do
        a = BinaryTreeNode.new(10)
        b = BinaryTreeNode.new(8)
        c = BinaryTreeNode.new(7)
        d = BinaryTreeNode.new(4)
        e = BinaryTreeNode.new(5)
        f = BinaryTreeNode.new(2)
        g = BinaryTreeNode.new(1)

        a.left = b
        a.right = c
        b.left = d
        b.right = e
        c.left = f
        c.right = g

        binary_tree = BinaryTree.new(root: a)
        binary_tree_analyzer = BinaryTreeAnalyzer.new(binary_tree)

        expect(binary_tree_analyzer.heap?).to be true
      end
    end

    context "not a heap" do
      it "returns false" do
        a = BinaryTreeNode.new(10)
        b = BinaryTreeNode.new(8)
        c = BinaryTreeNode.new(1)
        d = BinaryTreeNode.new(4)
        e = BinaryTreeNode.new(5)
        f = BinaryTreeNode.new(2)
        g = BinaryTreeNode.new(7)

        a.left = b
        a.right = c
        b.left = d
        b.right = e
        c.left = f
        c.right = g

        binary_tree = BinaryTree.new(root: a)
        binary_tree_analyzer = BinaryTreeAnalyzer.new(binary_tree)

        expect(binary_tree_analyzer.heap?).to be false
      end
    end
  end

  describe "binary_search_tree?" do
    context "is a binary search tree" do
      it "returns true" do
        a = BinaryTreeNode.new(8)
        b = BinaryTreeNode.new(3)
        c = BinaryTreeNode.new(10)
        d = BinaryTreeNode.new(1)
        e = BinaryTreeNode.new(6)
        f = BinaryTreeNode.new(9)
        g = BinaryTreeNode.new(14)

        a.left = b
        a.right = c
        b.left = d
        b.right = e
        c.left = f
        c.right = g

        binary_tree = BinaryTree.new(root: a)
        binary_tree_analyzer = BinaryTreeAnalyzer.new(binary_tree)

        expect(binary_tree_analyzer.binary_search_tree?).to be true
      end
    end

    context "not a binary search tree because two leaves aren't binaries" do
      it "returns false" do
        a = BinaryTreeNode.new(8)
        b = BinaryTreeNode.new(3)
        c = BinaryTreeNode.new(10)
        d = BinaryTreeNode.new(1)
        e = BinaryTreeNode.new(6)
        f = BinaryTreeNode.new(14)
        g = BinaryTreeNode.new(9)

        a.left = b
        a.right = c
        b.left = d
        b.right = e
        c.left = f
        c.right = g

        binary_tree = BinaryTree.new(root: a)
        binary_tree_analyzer = BinaryTreeAnalyzer.new(binary_tree)

        expect(binary_tree_analyzer.binary_search_tree?).to be false
      end
    end

    context "not a binary search tree because two subtrees aren't binaries" do
      it "returns false" do
        a = BinaryTreeNode.new(8)
        b = BinaryTreeNode.new(10)
        c = BinaryTreeNode.new(10)
        d = BinaryTreeNode.new(1)
        e = BinaryTreeNode.new(6)
        f = BinaryTreeNode.new(9)
        g = BinaryTreeNode.new(14)

        a.left = b
        a.right = c
        b.left = d
        b.right = e
        c.left = f
        c.right = g

        binary_tree = BinaryTree.new(root: a)
        binary_tree_analyzer = BinaryTreeAnalyzer.new(binary_tree)

        expect(binary_tree_analyzer.binary_search_tree?).to be false
      end
    end
  end
end
