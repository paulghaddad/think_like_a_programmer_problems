class BinaryTreeAnalyzer
  def self.largest_node(root)
    return 0 if root.nil?

    if (root.right.nil? && root.left.nil?)
      return root.value
    end

    left_max = largest_node(root.left)
    right_max = largest_node(root.right)
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
