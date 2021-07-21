require_relative 'node'
require_relative 'tree'
require 'pry-byebug'

test = Tree.new([1, 2, 3, 4, 5])
test.build_tree(test.array)