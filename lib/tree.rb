require_relative "node"

class Tree
  def initialize(arr = [])
    @arr = arr.uniq.sort
    @root = build_tree(@arr)
  end

  def build_tree(arr, start = 0, last = arr.length - 1)
    return nil if arr.empty?
    return if start > last

    mid = (start + last) / 2
    node = Node.new(arr[mid])

    node.left = build_tree(arr, start, mid - 1)
    node.right = build_tree(arr, mid + 1, last)
    node
  end
end
