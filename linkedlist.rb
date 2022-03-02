# frozen_string_literal: true

require_relative 'node'

# linked-list class
class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
    else
      @tail.next_node = new_node
    end
    @tail = new_node
  end

  def prepend(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      new_node.next_node = @head
      @head = new_node
    end
  end

  def size
    count = 1
    until @head.next_node.nil?
      @head = @head.next_node
      count += 1
    end
    count
  end

  def head
    puts @head.data
  end

  def tail
    puts @tail.data
  end

  def at_index(idx)
    count = 0
    until count == idx
      @head = @head.next_node
      count += 1
    end
    puts @head.data
  end

  def pop
    temp = @head
    @head = @head.next_node until @head.next_node == @tail
    @head.next_node = nil
    @tail = @head
    @head = temp
  end

  def contains?(value)
    temp = @head
    until @head.nil?
      if @head.data == value
        puts true
        @head = temp
        return true
      end
      @head = @head.next_node
    end
    @head = temp
    p false
  end

  def find(value)
    temp = @head
    idx = 0
    until @head.nil?
      if @head.data == value
        puts idx
        @head = temp
        return
      end
      idx += 1
      @head = @head.next_node
    end
    @head = temp
    p nil
  end

  def to_s
    temp = @head
    until @head.nil?
      print "( #{@head.data} ) -> "
      @head = @head.next_node
    end
    @head = temp
    print 'nil'
  end
end

my_list = LinkedList.new
my_list.prepend(8)
my_list.append(4)
my_list.append(9)
my_list.append(20)
my_list.head
my_list.tail
my_list.to_s
