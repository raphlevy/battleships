require_relative '../lib/player'
require_relative '../lib/board'
require_relative '../lib/ship'

describe Player do
  describe '#fire' do


    it 'returns true when fire hits a ship' do
    subject.board.place Ship.new, [3,3], :horizontal
      expect(subject.fire [3,3]).to match("Target hit!!")
    end
  end
end
