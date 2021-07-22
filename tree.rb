require 'pry-byebug'
# Build a balanced BST
  # Get the Middle of the array and make it root.
  # Recursively do same for left half and right half.
      # Get the middle of left half and make it left child of the root
      # Get the middle of right half and make it right child of the root

class Tree
  attr_accessor :array, :root, :find_node
  # initialize with an array
  def initialize(array)
  # has root instance variable
    @array = array
    @array = sort_array(@array)
    @root = build_tree(@array)
    @find_node = find_node
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

  def next_biggest_node(node)
    current = node
    # find the next biggest value by going to the far left of a subtree
    while current.left != nil
      current = current.left
    end
    return current
  end

  def delete(value, root = @root)
    return root if root == nil
    
    if value < root.data
      p "value: #{value}"
      p "root.data: #{root.data}"
      root.left = delete(value, root.left)
    elsif value > root.data
      puts "entered elsif value > root.data"
      root.right = delete(value, root.right)
    
    else
      puts "entered else statement"
      p "value: #{value}"
      p "root.data: #{root.data}"
      if root.left == nil
        puts "entered root.left if statement"
        p "root.right: #{root.right}"
        p "root.data: #{root.data}"
        root_right_placeholder = root.right
        root = nil
        return root_right_placeholder
      elsif root.right == nil
        puts "entered root.right elsif statement"
        p "root.left: #{root.left}"
        p "root.data: #{root.data}"
        root_left_placeholder = root.left
        root = nil
        return root_left_placeholder
      end

      # In the case of deleting a node with two children, find the next biggest value in its right subtree
      root_placeholder = next_biggest_node(root.right)
      p "root_placeholder: #{root_placeholder}"
      # Replace the node to be deleted with the next biggest
      root.data = root_placeholder.data
      p "root_placeholder.data: #{root_placeholder.data}"
      # Delete the next biggest node.
      root.right = delete(root_placeholder.data, root.right)
    end
    return root
  end

  def find(value, root = @root)
    if value < root.data
      root.left = find(value, root.left)
    elsif value > root.data
      root.right = find(value, root.right)
    elsif value == root.data
      p root.data
      @find_node = root
      return root
    end
    return @find_node if root == @root
    return root
  end

  # level order method
    # As a node is visited, reference all its children in a queue
    # Nodes in the queue, called discovered nodes, have their reference known but have not been visited yet
    # Start with the root of the tree in the queue
    # As long as the queue is not empty, 
    # take the node from the node from the front
    # visit the node
    # enqueue the left child
    # enqueue the right child

  # level_order
  def level_order(root = @root)
    # Termination condition: return if root is nil
    # Create an empty array as a queue to keep track of the addresses of child nodes  that have not been visited yet
    # Enqueue the root
      # While the queue is not empty,
      # Return the discovered node in front of the array
      # Remove said discovered node from the array
      # Enqueue the left child
      # Enqueue the right child
  end
  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end