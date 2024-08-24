# node class for binary search tree
class TreeNode
  include Comparable

  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def <=>(other)
    data <=> other.data
  end

  def leaf?
    @left.nil? && @right.nil?
  end
end

class QueueNode
  attr_accessor :data, :next

  def initialize(data)
    @data = data
    @next = nil
  end
end
