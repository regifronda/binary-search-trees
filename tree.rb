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

    # To the left of the root, call build_tree with arguments of array, middle_index + 1, end_index. Have middle_index + 1 as the new start_index will create a subarray and make the new middle_index the root of the subarray
    root.right = build_tree(array, (middle_index + 1), end_index)
    p "root.right: #{root.right}"
    p "root.data before return root: #{root.data}"
    return root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end