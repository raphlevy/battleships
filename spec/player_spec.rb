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
	    subject.board.place ship, [3,3], :vertical
	    allow(ship).to receive(:delete)
	      expect(subject.fire [3,3]).to eq('Target hit!!')
    end

    it 'returns false when fire does not hit a ship' do
    	subject.board.place ship, [3,3], :vertical
    	p subject.board.ship_list
      expect(subject.fire [0,0]).to match('You missed sucka!!')
    end

    it 'records my hits and misses' do
  	subject.board.place ship, [3,3], :vertical  
  	a = subject.history.length 
  	expect(ship).to receive(:delete).with([3,3])
  	subject.fire [3,3]
  	expect(subject.history.length).to be > a
  end

  it'raises an error if the player has already fire this cell' do
  	subject.board.place ship, [3,3], :vertical
  	expect(ship).to receive(:delete).with([3,3])
  	subject.fire [3,3]
  	expect{subject.fire [3,3]}.to raise_error 'You already fired this cell'
  end

	end

  it 'returns true if my board is empty' do
  	allow(subject.board).to receive(:ship_positions).and_return([])
  	expect(subject.end_game?).to eq true
  end

  # it 'should require two arguments' do
  # 	expect(subject.fire).to respond_to(:fire).with(2).argument
  # end


end
