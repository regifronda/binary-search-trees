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