class Ship

	DEFAULT_SIZE = 2

	attr_reader :size
	attr_accessor :coordinates

	def initialize size = DEFAULT_SIZE
  @coordinates = nil
  @size = size
	end

	def sink?
		if coordinates.empty?	
			true
		else
			false
		end
    end
		

	def delete cell
		@coordinates.delete(cell)	
	end

end
