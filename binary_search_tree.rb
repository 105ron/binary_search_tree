require_relative 'node.rb'
class BinarySearchTree


  attr_accessor :root

  def initialize(val = nil)
    # Initialize a new node at the head
    @root = Node.new(val)
  end


  def build_from_sorted(array, current = @root)
  	left,middle, right = divide(array)
  	current = Node.new(middle)
  	puts "middle #{middle}"
  	puts "left #{left}"
  	puts "right #{right}"
  end

  #private #commented for developement


  def divide(array)
  	divide_point = (array.length / 2)
  	divide_point += 1 if (array.length % 2 != 0) #left will be the bigger array if elements is odd
  	left,right = array.each_slice(divide_point).to_a
  	puts left.size
  	if left.size > 1 
  	  puts "in here"
  	  return left[0..-2], left[-1], right #middle is last element of left
  	else
  	  return left, nil, right
  	end
  end

end
 it = BinarySearchTree.new
 it.build_from_sorted([1,2,3,4,5,6,7])