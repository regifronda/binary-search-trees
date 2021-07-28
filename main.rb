require_relative 'node'
require_relative 'tree'
require 'pry-byebug'

bst = Tree.new((Array.new(15) { rand(1..100) }))
bst.pretty_print
p bst.balanced?
bst.preorder
bst.postorder
bst.inorder
[150, 151, 133, 162, 199].each { |value| bst.insert(value) }
bst.pretty_print
p bst.balanced?
bst.rebalance
bst.pretty_print
p bst.balanced?
bst.preorder
bst.postorder
bst.inorder