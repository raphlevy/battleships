class Board

	DEFAULT_BOUNDARY = 10

	attr_reader :boundary, :ship_list

	def initialize boundary = DEFAULT_BOUNDARY
		@boundary = boundary
		@ship_list = Hash.new
	end


	def ship_positions
		ship_list.values.inject([]){|memo, positions| memo + positions}
	end

	def place ship, cell, orientation
		test_negatives cell
		positions = ext_coord(ship, cell, orientation)
		test_overlap positions
		test_boundary positions
		ship.coordinates = positions
		@ship_list[ship] = positions
	end

	def ext_coord ship, cell, orientation
		x = cell[0]
		y = cell[1]
		if orientation == :horizontal
			return (0..ship.size - 1).map{ |element| [x + element, y] }
		elsif orientation == :vertical
			return (0..ship.size - 1).map{ |element| [x, y + element] }
		end
	end

	def test_negatives cell
		fail "Can't use negatve co-ordinates!" if cell.any? {|c| c < 0}
	end

	def test_boundary extracted_coordinates
		fail "Co-ordinates must not go off the board!" if extracted_coordinates.flatten.any? {|v| v > boundary-1}
	end

	def test_overlap extracted_coordinates
		 fail "Boats cannot overlap" unless (extracted_coordinates&self.ship_positions).empty?
	end

	def hit? cell
		self.ship_positions.include?(cell)
	end

	def hit cell
		self.ship_positions.delete(cell)
		which_ship(cell).delete cell
	end

	def which_ship cell
			if @ship_list.empty? 
				return "There is no ship on this cell" 
			end
			@ship_list.each do |ship, coordinates|
				if coordinates.include?(cell) == false 
					 return "There is no ship on this cell" 
				else
					return ship	
				end
			end
	end

end
