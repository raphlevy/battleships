require 'board'

describe Board do

	let(:ship) { double (:ship)}

	describe '#place' do
		it 'place function exists' do
			expect(subject).to respond_to :place	
		end

		it 'takes an argument' do
			expect(subject).to respond_to(:place).with(3).argument
		end
  end

	context 'length = 2 'do 
  let(:ship) { double (:ship), length: 2}
		it 'calculates the coordinates from cell' do
		expect(subject.ext_coord(ship, [0,0], :horizontal)).to match_array([[0,0],[1,0]])
		end

		it 'calculates the coordinates from cell' do
		expect(subject.ext_coord(ship, [0,0], :vertical)).to match_array([[0,0],[0,1]])
		end

	end

end