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
    node = TreeNode.new(arr[mid])

    node.left = build_tree(arr, start, mid - 1)
    node.right = build_tree(arr, mid + 1, last)
    node
  end

  def pretty_print(node = @root, prefix = "", is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(data, root = @root)
    new_node = TreeNode.new(data)
    return @root = new_node if root.nil?

    insert_node(new_node, @root)
  end

  private

  def insert_node(node, root)
    return if node == root

    if node < root
      root.left.nil? ? root.left = node : insert_node(node, root.left)
    elsif node > root
      root.right.nil? ? root.right = node : insert_node(node, root.right)
    end
  end
end
