require_relative 'node'
require_relative 'tree'
require 'pry-byebug'

# test = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
test = Tree.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
test.pretty_print
test.delete(7)
test.pretty_print
test.level_order