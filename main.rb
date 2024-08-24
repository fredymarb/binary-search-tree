require_relative "lib/tree"

bst = Tree.new([1, 2, 3, 4, 5, 6, 7])
# bst = Tree.new
bst.insert(10)
bst.insert(5)
bst.insert(15)
bst.insert(3)

bst.pretty_print
p bst.in_order
p bst.pre_order
p bst.post_order
# p bst.cool_method
