require_relative '../lib/player'
require_relative '../lib/board'
require_relative '../lib/ship'
require_relative '../lib/game'

describe Game do

	let(:player) {double (:player), :'history=' => Hash.new }
	
	it'allows a player1 to fire to the player2\'s board' do
		subject.fire_p player, [1,1]
		expec(player.history).not_to be_empty 
	end
end