class Tree
  attr_accessor :array, :root, :find_node
  def initialize(array)
    @array = array
    @array = sort_array(@array)
    @root = build_tree(@array)
    @find_node = find_node
  end

  def sort_array(array)
    array = array.sort
    array = array.uniq
  end

  def build_tree(array, start_index = 0, end_index = array.length - 1)
    array = sort_array(array)
    return nil if (start_index > end_index)

    middle_index = (start_index + end_index) / 2
    root = Node.new(array[middle_index])
    root.left = build_tree(array, start_index, (middle_index - 1))
    root.right = build_tree(array, (middle_index + 1), end_index)
    return root
  end

  def insert(value, root = @root)
    if root == nil
      root = Node.new(value)
    end
    if value < root.data
      root.left = insert(value, root.left)
    elsif value > root.data
      root.right = insert(value, root.right)
    end
    return root
  end

  def next_biggest_node(node)
    current = node
    while current.left != nil
      current = current.left
    end
    return current
  end

  def delete(value, root = @root)
    return root if root == nil
    
    if value < root.data
      root.left = delete(value, root.left)
    elsif value > root.data
      root.right = delete(value, root.right)
    
    else
      if root.left == nil
        root_right_placeholder = root.right
        root = nil
        return root_right_placeholder
      elsif root.right == nil
        root_left_placeholder = root.left
        root = nil
        return root_left_placeholder
      end

      root_placeholder = next_biggest_node(root.right)
      root.data = root_placeholder.data
      root.right = delete(root_placeholder.data, root.right)
    end
    return root
  end
  
  def inorder
    current = @root
    stack = []
    array_of_values = []
    while true
      if current != nil
        stack << current
        current = current.left
      elsif stack != []
        current = stack.pop
        array_of_values << current.data
        current = current.right
      else
        break
      end
    end
    p array_of_values 
  end

  def preorder
    return if root.nil?
    current = @root
    stack = Array.new
    array_of_values = Array.new
    stack << current
    while stack != []
      current = stack.pop
      array_of_values << current.data
      if current.right != nil
        stack << current.right
      end
      if current.left != nil
        stack << current.left
      end
    end
    p array_of_values
  end


  def postorder
    reverse_postorder_stack = Array.new
    values = Array.new
    reverse_postorder_stack << @root
    while reverse_postorder_stack != []
      current = reverse_postorder_stack.pop
      values << current.data
      
      if current.left != nil
        reverse_postorder_stack << current.left
      end
      if current.right != nil
        reverse_postorder_stack << current.right
      end
    end
    p values.reverse  
  end

  def level_order
    return if root.nil?

    discovered_nodes = Array.new
    result = Array.new
    discovered_nodes << @root

    while discovered_nodes.length > 0
      value_to_add_to_result = discovered_nodes[0]
      value_to_add_to_result = value_to_add_to_result.data
      result << value_to_add_to_result
      node = discovered_nodes.shift
      if node.left != nil
        discovered_nodes << node.left
      end
      if node.right != nil
        discovered_nodes << node.right
      end
    end
    p result
  end


  def find(value, root = @root)
    if value < root.data
      root.left = find(value, root.left)
    elsif value > root.data
      root.right = find(value, root.right)
    elsif value == root.data
      @find_node = root
      return root
    end
    return @find_node if root == @root
    return root
  end

  def find_maximum_height(value, root = @root)
    $height_global
    return -1 if root == nil
    left_subtree_height = find_maximum_height(value, root.left)
    right_subtree_height = find_maximum_height(value, root.right)
    result = [left_subtree_height, right_subtree_height].max + 1
    if root.data == value
      $height_global = result
    end
      return result
  end

  def height(value, root = @root)
    $height_global
    tree_height = find_maximum_height(value)
    return $height_global
  end

  def depth(value, root = @root)
    return -1 if root.nil?

    depth_variable = -1
    if root.data == value
      return depth_variable + 1
    end

    depth_variable = depth(value, root.left)
    if depth_variable >= 0
      return depth_variable + 1
    end
    depth_variable = depth(value, root.right)
    if depth_variable >= 0
      return depth_variable + 1
    end
    return depth_variable
  end

  def find_subtree_height(root)
    return 0 if root.nil?
    return [find_subtree_height(root.left), find_subtree_height(root.right)].max + 1
  end

  def balanced?(root = @root)
    return true if root.nil?
    
    left_subtree_height = find_subtree_height(root.left)
    right_subtree_height = find_subtree_height(root.right)
    
    if (left_subtree_height - right_subtree_height).abs <= 1 && 
      balanced?(root.left) == true && 
      balanced?(root.right) == true
      return true
    end

    return false
  end
  
  def rebalance
    @array = level_order
    @array = sort_array(@array)
    @root = build_tree(@array)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end