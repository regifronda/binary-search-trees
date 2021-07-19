# Build a balanced BST
  # Get the Middle of the array and make it root.
  # Recursively do same for left half and right half.
      # Get the middle of left half and make it left child of the root
      # Get the middle of right half and make it right child of the root

# Node class with attributes data, left, right
class Node
  attr_accessor :data, :left, :right
  # include Comparable module
  include Comparable

  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end
end

# Tree class
  # initialize with an array
  # has root instance variable

  # build_tree(array, start = nil, end = nil)
    # array.sort
    # array.uniq
    # return nil 
    # start = 0
    # end = array.length - 1
    # middle = (start + end) / 2
    # Create a Node with middle of the array as the root.
    # To the left of the root, call build_tree with arguments of array, start, and middle - 1
    # To the left of the root, call build_tree with arguments of array, start, and middle - 1
    # return @root