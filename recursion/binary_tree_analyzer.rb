require 'pry'

class BinaryTreeAnalyzer
  attr_reader :root

  def initialize(binary_tree)
    @root = binary_tree.root
  end

  def largest_node
    largest_node_recursive(root: root)
  end

  private

  def largest_node_recursive(root:)
    return 0 if root.nil?

    if (root.right.nil? && root.left.nil?)
      return root.value
    end

    left_max = largest_node_recursive(root: root.left)
    right_max = largest_node_recursive(root: root.right)
    max_num = root.value

    if left_max > max_num
      max_num = left_max
    end

    if right_max > max_num
      max_num = right_max
    end

    max_num
  end
end
