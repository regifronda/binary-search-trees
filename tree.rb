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
    p "array in build_tree: #{array}"
    # sort array
    # remove duplicates in array
    array = sort_array(array)

    # create termination condition of recursion: return nil if start_index is greater than end_index
    return nil if (start_index > end_index)
    # middle = (start + end) / 2
    middle_index = (start_index + end_index) / 2
    p "start_index: #{start_index}"
    p "end_index: #{end_index}"
    p "middle_index: #{middle_index}"
    p "middle index value: #{array[middle_index]}"
    # Create a Node with middle of the array as the root.
    root = Node.new(array[middle_index])
    p "root.data #{root.data}"
    # To the left of the root, call build_tree with arguments of array, start, and middle_index - 1. Have middle_index - 1 as the new end_index will create a subarray and make the new middle_index the root of the subarray
    root.left = build_tree(array, start_index, (middle_index - 1))
    p "root.left: #{root.left}"
    p "root: #{root} root.data: #{root.data}"

    # To the left of the root, call build_tree with arguments of array, middle_index + 1, end_index. Have middle_index + 1 as the new start_index will create a subarray and make the new middle_index the root of the subarray
    root.right = build_tree(array, (middle_index + 1), end_index)
    p "root.right: #{root.right}"
    p "root: #{root} root.data: #{root.data}"
    p "root.data before return root: #{root.data}"
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
  def delete(value, root)
    # Termination condition: if the tree is empty, return root
    return root if root == nil
    # If the node to be deleted is the leaf, remove it from the tree.

    # If the node to be deleted only has one child, copy the child of the node and delete the child.
      # Doing so replaces the node to be deleted with its child.
    # If the node to be deleted has two children, find the next biggest node in the tree. by first looking in its right subtree.
      # In the right subtree, the node on the far left is the next biggest.
      # Recursively remove the node in the right subtree.
      # Copy the next biggest, delete it, and replace the node to be deleted with the next biggest.
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end