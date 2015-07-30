require_relative '../lib/player'
require_relative '../lib/board'
require_relative '../lib/ship'

describe Player do
  describe '#fire' do

  	let(:ship) { double (:ship), size: 2, :'coordinates=' => nil }

  	before do
  		allow(ship).to receive(:'coordinates=').and_return([[3,3], [3,4]])
  	end

    it 'returns true when fire hits a ship' do
	    subject.board.place ship, [3,3], :horizontal
	    allow(ship).to receive(:delete)
	      expect(subject.fire [3,3]).to eq('Target hit!!')
    end

    it 'returns false when fire does not hit a ship' do
    	subject.board.place ship, [3,3], :horizontal
    	p subject.board.ship_list
      expect(subject.fire [0,0]).to match('You missed sucka!!')
    end

  end

  it 'returns true if my board is empty' do
  	allow(subject.board).to receive(:ship_positions).and_return([])
  	expect(subject.end_game?).to eq true
  end
end
