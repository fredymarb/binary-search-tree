# node class for binary search tree
class Node
  attr_accessor :value, :left, :right

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
