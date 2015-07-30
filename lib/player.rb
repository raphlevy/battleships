require_relative 'board'
require_relative 'ship'

class Player

  attr_reader :board

  def initialize
    @board = Board.new
    #need to make a DI
  end


  def fire cell
	  if board.hit?(cell)
		board.hit(cell)
		return 'Target hit!!' 
	  else
		'You missed sucka!!'
	  end
  end

  def end_game? 
  	@board.ship_positions.empty?
  end

end
