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
	end

end
