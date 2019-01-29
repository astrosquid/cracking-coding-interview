class TreeNode
  attr_accessor :value, :left, :right
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

def tree
  <<~TREEDOC
     7
   3   2
    5 8 1
  TREEDOC
end

def in_order_doc
  <<~INORDER
  # in-order traversal:
  # left branch
  # -> then current node
  #   -> then right branch
  #   (If you do this on a binary 
  #   search tree, you'll print
  #   the numbers in ascending 
  #   order.)
  INORDER
end

def in_order_traversal(node)
  if node.left
    in_order_traversal(node.left)
  end

  print node.value.to_s + ' '

  if node.right
    in_order_traversal(node.right)
  end
end

def pre_order_doc
  <<~PREORDER
  # pre-order trav: 
  # current node
  # -> then left node
  #   -> then right node
  PREORDER
end

def pre_order_traversal(node)
  print node.value.to_s + ' '

  if (node.left)
    pre_order_traversal(node.left)
  end

  if node.right
    pre_order_traversal(node.right)
  end
end

def post_order_doc
  <<~POSTORDER
  # post-order trav:
  # left node
  # -> then right node
  #   -> then current node
  POSTORDER
end

def post_order_traversal(node)
  if node.left
    post_order_traversal(node.left)
  end

  if node.right
    post_order_traversal(node.right)
  end

  print node.value.to_s + ' '
end

def main
  puts "Tree layout:"
  puts tree
  puts ''

  # Level 1
  root = TreeNode.new(7)

  # Level 2
  root.left = TreeNode.new(3)
  root.right = TreeNode.new(2)
  
  # Level 3 
  root.left.right = TreeNode.new(5)
  root.right.left = TreeNode.new(8)
  root.right.right = TreeNode.new(1)

  puts in_order_doc
  puts "Expected: 3 5 7 8 2 1"
  print "Actual:   "
  in_order_traversal(root)
  puts ''

  puts ''
  puts pre_order_doc
  puts "Expected: 7 3 5 2 8 1"
  print "Actual:   "
  pre_order_traversal(root)
  puts ''

  puts ''
  puts post_order_doc
  puts "Expected: 5 3 8 1 2 7"
  print "Actual:   "
  post_order_traversal(root)
  puts ''

end

main
