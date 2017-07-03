class BinaryTreeNode
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

# a = BinaryTreeNode.new(1)
# b = BinaryTreeNode.new(4)
# c = BinaryTreeNode.new(-2)
#
# a.left = b
# a.right = c
