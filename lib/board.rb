class Board

	def initialize 
		@ship_positions = []
	end

	def place ship, cell		
		@ship_positions += position
	end

	def ext_coord ship, cell, orientation
		x = cell[0]
		y = cell[1]
		if orientation == :horizontal 
		return (0..ship.length - 1).map{ |element| [x + element, y] }
		elsif orientation == :vertical
		return (0..ship.length - 1).map{ |element| [x, y + element] }
		end 		 	
	end

end