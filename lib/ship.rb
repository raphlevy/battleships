class Ship

	DEFAULT_SIZE = 2

	attr_reader :size
	attr_accessor :coordinates

	def initialize size = DEFAULT_SIZE
  @coordinates = nil
  @size = size
	end

end
