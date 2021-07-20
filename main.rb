require_relative 'node'
require_relative 'tree'
require 'pry-byebug'

test = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
test.build_tree(test.array)