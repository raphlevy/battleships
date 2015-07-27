require 'board'

describe Board do

	let(:ship) { double (:ship) }

	describe '#place' do
		it 'place function exists' do
			expect(subject).to respond_to :place	
		end

		it 'takes an argument' do
			expect(subject).to respond_to(:place).with(1).argument
		end

	end

end