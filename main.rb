require_relative "lib/tree"

bst = Tree.new([1, 2, 3, 4, 5, 6, 7])
# bst = Tree.new
bst.insert(10)
bst.insert(5)
bst.insert(15)
bst.insert(4.5)

bst.pretty_print
# puts bst.height
puts bst.depth(bst.find(4.5))
