require 'pry-byebug'

class Tree
  attr_accessor :array, :root
  # initialize with an array
  def initialize(array)
  # has root instance variable
    @array = array
    @root = root
    @array = sort_array(@array)
    p "@array at initialization: #{@array}"
  end

  def sort_array(array)
    p "array's class: #{array.class}"
    array = array.sort
    array = array.uniq
  end

  # build_tree(array, start_index = nil, end = nil)
    # set variable start_index to 0
    # set end_index to = array.length - 1
  def build_tree(array = [], start_index = 0, end_index = 0)
    




    p "array in build_tree: #{array}"
    # sort array
    # remove duplicates in array
    array = sort_array(array)

    p "@array: #{@array}"
    end_index = array.length - 1
    p "end_index: #{end_index}"

    # create termination condition of recursion: return nil if start_index is greater than end_index
    return nil if (start_index > end_index)
    # middle = (start + end) / 2
    middle_index = (start_index + end_index) / 2
    p "middle_index: #{middle_index}"
    p "middle index value: #{array[middle_index]}"
    # Create a Node with middle of the array as the root.
    @root = Node.new(array[middle_index])
    p "root #{root}"
    p "root data: #{@root.data}"
    # To the left of the root, call build_tree with arguments of array, start, and middle_index - 1. Have middle_index - 1 as the new end_index will create a subarray and make the new middle_index the root of the subarray
    @root.left = build_tree(array, start_index, (middle_index - 1))
    p @root.left
    # To the left of the root, call build_tree with arguments of array, middle_index + 1, end_index. Have middle_index + 1 as the new start_index will create a subarray and make the new middle_index the root of the subarray
    @root.right = build_tree(array, (middle_index + 1), end_index)
    p @root.right
    # return @root
    return @root
  end
end