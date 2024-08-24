require_relative "node"
require_relative "custom_queue"

class Tree
  attr_accessor :root

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

  def pretty_print(node = @root, prefix = "", is_left = true) # rubocop:disable Style/OptionalBooleanParameter
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(data, root = @root)
    new_node = TreeNode.new(data)
    return @root = new_node if root.nil?

    insert_node(new_node, @root)
  end

  def delete(data)
    @root = delete_node(data, @root)
  end

  def find(data, root = @root)
    return nil if root.nil?

    return root if data == root.data
    return find(data, root.left) if data < root.data
    return find(data, root.right) if data > root.data

    nil
  end

  def level_order(root = @root)
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

  def delete_node(data, root)
    return root if root.nil?

    # traverse the tree to get to the node
    # that matches the data
    if data < root.data
      root.left = delete_node(data, root.left)
    elsif data > root.data
      root.right = delete_node(data, root.right)
    elsif data == root.data
      # remove a leaf node
      return root = nil if root.leaf?

      # remove node with only one child
      return root = root.right if root.left.nil?
      return root = root.left if root.right.nil?

      # remove node with two children
      root.data = min(root.right)
      root.right = delete_node(root.data, root.right)
    end

    root
  end

  # returns the minimum value in the tree
  def min(root = @root)
    return root.data if root.left.nil?

    min(root.left)
  end

  # returns the maximum value in the tree
  def max(root = @root)
    return root.data if root.right.nil?

    max(root.right)
  end
end
