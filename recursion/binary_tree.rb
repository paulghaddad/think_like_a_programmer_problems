class BinaryTree
  attr_reader :root

  def initialize(root:)
    @root = root
  end

  def largest_node
    return 0 if root.nil?

    if (root.right.nil? && root.left.nil?)
      return root.value
    end

    left_max = BinaryTree.new(root: root.left).largest_node
    right_max = BinaryTree.new(root: root.right).largest_node
    max_num = root.value

    if left_max > max_num
      max_num = left_max
    end

    if right_max > max_num
      max_num = right_max
    end

    max_num
  end

  def number_of_leaves
    leaf_count(root)
  end

  private

  def leaf_count(root)
    return 0 if root.nil?

    if (root.right.nil? && root.left.nil?)
       1
    else
      left_count = leaf_count(root.left)
      right_count = leaf_count(root.right)
      left_count + right_count
    end
  end
end
