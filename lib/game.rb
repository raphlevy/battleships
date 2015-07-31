require'player'

class Game

	attr_reader :p1, :p2

	def initialize 
		@p1 = Player.new
		@p2 = Player.new 
	end

	def fire_p player, cell
		player.fire(cell)
		player.history
	end

end
