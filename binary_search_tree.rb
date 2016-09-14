require_relative 'node.rb'
class BinarySearchTree


  attr_accessor :root

  def initialize(val = nil)
    # Initialize a new node at the head
    @root = Node.new(val)
  end


  def build_from_sorted(array)
    puts "I'm now diving #{array}"
    if array.size >=3
      divide_point = (array.length / 2)
      divide_point += 1 if (array.length % 2 != 0) #left will be the bigger array if elements is odd
      left,right = array.each_slice(divide_point).to_a
      input_to_tree(left[-1])
      build_from_sorted(left[0..-2])     #last element of left will be middle element
      build_from_sorted(right)
    elsif array.length == 2
      input_to_tree(array[0])
      input_to_tree(array[1])
    else array.length == 1
      input_to_tree(array[0])
    end
  end

  def input_to_tree(value)
   # puts input
   # current = @root
   # assigned = false
   # until assigned == true
   #   if current.value == nil
   #     current = Node.new(input)
   #     assigned = true
   #   elsif input < current.value
   #     puts "heading left"
   #     if current.left == nil
   #       current.left = Node.new(input)
   #     else
   #       current = current.left
   #     end
   #   else

   #     current = current.right
   #   end
   # end
   # puts @root.inspect
   set = nil
   if @root.value == nil
    @root.value = value
    set = true
  end
   puts value
      cur_node = @root
      while not set
        if value > cur_node.value
          if cur_node.right == nil
            cur_node.right = Node.new(value,nil, nil, cur_node)
            puts "inspecting"
            puts cur_node.inspect
            set = true
          else
            cur_node = cur_node.right
          end
        else
          if cur_node.left == nil 
            cur_node.left = Node.new(value,nil, nil, cur_node)
            set = true
          else
            cur_node = cur_node.left
          end
        end
      end
    puts @root.inspect
  end



  #private #commented for developement

end
 it = BinarySearchTree.new
 it.build_from_sorted([1,2,3,4,5,6,7,8,9])