require 'board'

describe Board do

	let(:ship) { double (:ship), size: 3, :"coordinates=" => nil}

	describe '#place' do
		it 'place function exists' do
			expect(subject).to respond_to :place
		end

		it 'takes an argument' do
			expect(subject).to respond_to(:place).with(3).argument
		end

		it 'does not accept negative x co-ordinates' do
			expect{ subject.place(ship, [-1, 3], :horizontal) }.to raise_error "Can't use negatve co-ordinates!"
		end

		it 'does not accept negative y co-ordinates' do
			expect{ subject.place(ship, [1, -3], :horizontal) }.to raise_error "Can't use negatve co-ordinates!"
		end

		context '#test_boundary and overlap' do
			# let(:ship) { double (:ship), size: 3, :'coordinates=' => nil}
			it 'does not accept x co-ordinates out of boundary' do
				bound = subject.boundary
				expect{ subject.place( ship, [bound-1,2], :horizontal) }.to raise_error "Co-ordinates must not go off the board!"
			end

			it 'does not accept y-coordinates out of the boundary' do
				bound = subject.boundary
				expect{ subject.place(ship, [2, bound-1], :vertical)}.to raise_error "Co-ordinates must not go off the board!"
			end

			it 'does not overlap' do
				subject.place ship, [1,1], :vertical
				expect{subject.place ship, [1,1], :vertical}.to raise_error"Boats cannot overlap"
			end
	  end
  end

	describe '#ext_coord' do
		context 'size = 2' do
	  let(:ship) { double (:ship), size: 2}
			it 'calculates the coordinates from cell' do
			expect(subject.ext_coord(ship, [0,0], :horizontal)).to match_array([[0,0],[1,0]])
			end

			it 'calculates the coordinates from cell' do
			expect(subject.ext_coord(ship, [0,0], :vertical)).to match_array([[0,0],[0,1]])
			end
		end
	end

	describe '#hit?' do
		it 'returns true when target cell belongs to @ship_positions' do
			cell = [3,3]
			subject.place ship, [3,3], :horizontal
			expect(subject.hit? cell).to be true
		end

		it 'returns a message when there is no ship on this cell' do
			expect(subject.hit? [1,1]).to eq false
		end
	end

	describe '#hit' do
		it 'deletes the correct cell from the ship stored in the ship list' do
			#expect(subject)
		end

		it 'deletes the cell of the ship hit' do
		subject.place ship, [1,1], :vertical
		allow(ship).to receive(:coordinates).and_return([[1,1],[1,2]])
		expect(ship).to receive(:delete).with([1,1])
		subject.hit [1,1]
		end

	end

	describe '#which_ship' do
		it 'returns a ship when we enter a cell' do
			subject.place ship, [1,1], :vertical
	        expect(subject.which_ship [1,1]).to eq ship
		end

		it 'returns a message when there is no ship in ths cell' do
			subject.place ship, [5,5], :vertical
			expect(subject.which_ship [1,1]).to eq "There is no ship on this cell"
		end

		it 'returns the same message when the board is empty' do
			expect(subject.which_ship [1,1]).to eq "There is no ship on this cell"
		end 

	end

	#Need to write a test for ship_positions

end
