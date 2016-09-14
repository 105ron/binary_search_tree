class Node
  attr_accessor :value, :parent, :left, :right

  def initialize(value = nil, left = nil, right = nil, parent = nil)
	@value = value
	@left = left
	@right = right
	@parent = parent
  end

end
