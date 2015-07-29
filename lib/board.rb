class Board

	DEFAULT_BOUNDARY = 10

	attr_reader :boundary

	def initialize boundary = DEFAULT_BOUNDARY
		@boundary = boundary
		@ship_positions = Hash.new
	end

	def place ship, cell, orientation
		test_negatives cell
		positions = ext_coord(ship, cell, orientation)
		test_overlap positions
		test_boundary positions
		@ship_positions += positions
		ship.coordinates = positions
		#need to save to the ship its coordinates
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
		    fail "Boats cannot overlap" unless (extracted_coordinates&@ship_positions).empty?
	end

	def hit? cell
		@ship_positions.include?(cell)
	end

	def hit cell
		@ship_positions.delete(cell)
	end

end
