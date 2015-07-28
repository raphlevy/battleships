class Ship 
	
	DEFAULT_SIZE = 2

	attr_reader :size

	attr_accessor :coordinates 

	def initialize coordinates = nil, size = DEFAULT_SIZE
  @coordinates = coordinates
  @size = size
	end

end