require 'pry'

class BinaryTreeAnalyzer
  attr_reader :root

  def initialize(binary_tree)
    @root = binary_tree.root
  end

  def largest_node
    largest_node_recursive(root: root)
  end

  def number_of_leaves
    leaf_count(root)
  end

  def heap?
    is_a_heap?(root)
  end

  def binary_search_tree?
    is_a_binary_search_tree?(root)
  end

  def binary_search(element)
    check_for_valid_binary_search_tree(root)
    search_binary_tree(root, element)
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

  def is_a_heap?(root)
    return true if on_a_leaf?(root)

    left_leaf_a_heap = is_a_heap?(root.left)
    right_leaf_a_heap = is_a_heap?(root.right)

    if left_leaf_a_heap && right_leaf_a_heap && root.value > root.left.value && root.value > root.right.value
      true
    else
      false
    end
  end

  def is_a_binary_search_tree?(node)
    return true if on_a_leaf?(node)

    left_leaf_a_binary_tree = is_a_binary_search_tree?(node.left)
    right_leaf_a_binary_tree = is_a_binary_search_tree?(node.right)

    if left_leaf_a_binary_tree && right_leaf_a_binary_tree && node.value > node.left.value && node.value < node.right.value
      true
    else
      false
    end
  end

  def on_a_leaf?(node)
    node.nil? || (node.left.nil? && node.right.nil?)
  end

  def check_for_valid_binary_search_tree(node)
    unless is_a_binary_search_tree?(node)
      raise InvalidBinarySearchTreeError.new("Not a valid binary search tree!")
    end
  end

  def search_binary_tree(node, element)
    return if node.nil?
    return true if node.value == element

    element_present_in_left_node = search_binary_tree(node.left, element)
    element_present_in_right_node = search_binary_tree(node.right, element)

    if element_present_in_left_node || element_present_in_right_node
      true
    else
      false
    end
  end
end

class InvalidBinarySearchTreeError < StandardError
  def initialize(message)
    super(message)
  end
end
