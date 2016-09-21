require_relative 'node.rb'
class BinarySearchTree


  attr_accessor :root

  def initialize(val = nil)
    # Initialize a new node at the head
    @root = Node.new(val)
  end


  def build_from_sorted(array)
    #This method takes a sorted array and passes it to input_to_tree recursively
    #So that our root node is in the middle of our values and the tree is balanced
    if array.size >=3
      divide_point = (array.length / 2)
      divide_point += 1 if (array.length % 2 != 0) #left will be the bigger array if elements is odd
      left,right = array.each_slice(divide_point).to_a
      input_to_tree(left[-1])   #last element of left will be middle element
      build_from_sorted(left[0..-2])     
      build_from_sorted(right)
    elsif array.length == 2
      input_to_tree(array[0])
      input_to_tree(array[1])
    else array.length == 1
      input_to_tree(array[0])
    end
  end


  def build_tree(array)
    array.each do |element|
      input_to_tree(element)
    end
  end


  def breadth_first_search(value)
    queue = []
    queue << @root
    while queue[0] != nil
      current_node = queue.shift #queue[0] is assigned to current_node and removed from queue
      if current_node.value == value
        return "#{current_node} is holding #{current_node.value}"  #explicit return to quit the loop
      else
        queue << current_node.left unless current_node.left == nil #adding left to our queue if it's not nil
        queue << current_node.right unless current_node.right == nil
      end
    end
    return nil
  end


  def depth_first_search(value)
    stack = []
    stack[0] = @root
    while stack[0] != nil
      current_node = stack[-1] #take last element from the stack
      stack.pop #remove element from the stack
      if current_node.value == value
        return "#{current_node} is holding #{current_node.value}"  #explicit return to quit the loop
      else
        stack << current_node.right unless current_node.right == nil
        stack << current_node.left unless current_node.left == nil #adding left to our stack last so we can pull it off first in next iteration
      end
    end
    return nil
  end


  def dfs_rec(value, current_node = @root)
    return "#{current_node} is holding #{current_node.value}" if value == current_node.value
    unless current_node.left.nil?
      result = dfs_rec(value, current_node.left)
      return result unless result == nil
    end
    unless current_node.right.nil?
      result = dfs_rec(value, current_node.right)
      return result unless result == nil
    end
  nil
  end


  def input_to_tree(value)
    set = nil
    if @root.value == nil #if root value not set. Set and don't run the loop
      @root.value = value
      set = true
    end
      current_node = @root
      while not set
        if value > current_node.value
          if current_node.right == nil
            current_node.right = Node.new(value,nil, nil, current_node)
            set = true
          else
            current_node = current_node.right
          end
        else
          if current_node.left == nil 
            current_node.left = Node.new(value,nil, nil, current_node)
            set = true
          else
            current_node = current_node.left
          end
        end
      end
    #puts @root.inspect #for developement
  end


end
 it = BinarySearchTree.new
 it.build_from_sorted([1,2,3,4,5,6,7])
 puts it.breadth_first_search(4)
 puts it.dfs_rec(1)
 