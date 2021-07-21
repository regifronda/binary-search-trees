# Node class with attributes data, left, right
class Node
  attr_accessor :data, :left, :right
  # include Comparable
  include Comparable
      
  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end