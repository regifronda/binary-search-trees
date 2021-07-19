# Build a balanced BST
  # Get the Middle of the array and make it root.
  # Recursively do same for left half and right half.
      # Get the middle of left half and make it left child of the root
      # Get the middle of right half and make it right child of the root

require 'pry-byebug'

# Node class with attributes data, left, right
class Node
  attr_accessor :data, :left, :right
  # include Comparable
  include Comparable

  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end
end

# Tree class
class Tree
  attr_accessor :array, :root
  # initialize with an array
  def initialize(array)
  # has root instance variable
    @array = array
    @root = root
  end

  # build_tree(array, start_index = nil, end = nil)
    # set variable start_index to 0
    # set end_index to = array.length - 1
  def build_tree(array, start_index = 0, end_index = 0)
    # sort array
    @array = @array.sort
    # remove duplicates in array
    @array = @array.uniq
    end_index = @array.length - 1
    p "end_index: #{end_index}"
    p "array: #{@array}"

    # create termination condition of recursion: return nil if start_index is greater than end_index
    return nil if (start_index > end_index)
    # middle = (start + end) / 2
    middle_index = (start_index + end_index) / 2
    p "middle_index: #{middle_index}"
    # Create a Node with middle of the array as the root.
    # To the left of the root, call build_tree with arguments of array, start, and middle - 1
    # To the left of the root, call build_tree with arguments of array, start, and middle - 1
    # return @root
  end
end

test = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
test.build_tree(@array)
