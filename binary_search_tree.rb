require_relative 'node.rb'
class BinarySearchTree


  attr_accessor :root

  def initialize(val)
    # Initialize a new node at the head
    @root = Node.new(val)
  end


end
