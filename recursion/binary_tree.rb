class BinaryTree
  attr_reader :root

  def initialize(root:)
    @root = root
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
