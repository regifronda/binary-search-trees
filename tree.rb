require 'pry-byebug'
# Build a balanced BST
  # Get the Middle of the array and make it root.
  # Recursively do same for left half and right half.
      # Get the middle of left half and make it left child of the root
      # Get the middle of right half and make it right child of the root

class Tree
  attr_accessor :array, :root
  # initialize with an array
  def initialize(array)
  # has root instance variable
    @array = array
    @array = sort_array(@array)
    @root = build_tree(@array)
  end

  def sort_array(array)
    array = array.sort
    array = array.uniq
  end

  # build_tree(array, start_index = nil, end = nil)
    # set variable start_index to 0
    # set end_index to = array.length - 1
  def build_tree(array, start_index = 0, end_index = array.length - 1)
    array = sort_array(array)
    return nil if (start_index > end_index)
    
    middle_index = (start_index + end_index) / 2
    root = Node.new(array[middle_index])
    root.left = build_tree(array, start_index, (middle_index - 1))
    root.right = build_tree(array, (middle_index + 1), end_index)
    return root
  end

  # To insert a value in a balanced binary search tree,
    # Start comparing the value to the root. If smaller, go to left subtree. If greater, right subtree
    # the inserted value will always be the leaf of a tree
    # So, when there's no left or right subtree, place a new node for the given value.
    
  # insert method that accepts a value to insert
  def insert(value, root = @root)
    # If the subtree is empty, return a new node
    if root == nil
      root = Node.new(value)
    end
    # Otherwise, continue recursing down the left subtree if the value is less than the root
    if value < root.data
      root.left = insert(value, root.left)
    # recurse down the right subtree if the value is greater than the root
    elsif value > root.data
      root.right = insert(value, root.right)
    end
    # return root
    return root
  end

  # To delete a node in a balanced binary search tree without unbalancing, consider several cases.
    # If the node to be deleted is the leaf, remove it from the tree.
    # If the node to be deleted only has one child, copy the child of the node and delete the child.
      # Doing so replaces the node to be deleted with its child.
    # If the node to be deleted has two children, find the next biggest node in the tree. by first looking in its right subtree.
      # In the right subtree, the node on the far left is the next biggest.
      # Recursively remove the node in the right subtree.
      # Copy the next biggest, delete it, and replace the node to be deleted with the next biggest.
  # To delete a node in a balanced binary search tree without unbalancing, consider several cases.
  def delete(value, root = @root)
    # Termination condition: if the tree is empty, return root
    return root if root == nil
    # Otherwise continue recursing down the tree
    if value < root.data
      root.left = delete(value, root.left)
    elsif value > root.data
      root.right = delete(value, root.right)
    # If the value is the same as the node's data, that is the node to be deleted.
    else
      puts "entered else statement"
    # If the node to be deleted is the leaf, remove it from the tree.
    # If the node to be deleted only has one child, copy the child of the node and delete the child.
      if root.left == nil
        root_right_placeholder = root.right
        root = nil
        return root_right_placeholder
      elsif root.right == nil
        root_left_placeholder = root.left
        root = nil
        return root_left_placeholder
      end
    end
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end