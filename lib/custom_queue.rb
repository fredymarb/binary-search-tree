require_relative "node"

class MyQueue
  attr_reader :head, :size

  def initialize
    @head = nil
    @size = 0
  end

  def enqueue(data)
    new_node = QueueNode.new(data)

    @size += 1
    return @head = new_node if @head.nil?

    current = @head
    current = current.next until current.next.nil?
    current.next = new_node
  end

  def dequeue
    return nil if @head.nil?

    current = @head
    @head = current.next
    @size -= 1

    current.data
  end
end
