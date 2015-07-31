require_relative 'board'
require_relative 'ship'

class Player

  attr_reader :board, :history

  def initialize
    @board = Board.new
    #need to make a DI
    @history = Hash.new 
  end


  def fire cell
	  fail 'You already fired this cell' if history.keys.include?(cell)
	  if board.hit?(cell)
		board.hit(cell)
		hit_and_misses(cell, 'Hit')
		return 'Target hit!!' 
	  else
	  	hit_and_misses(cell, 'Miss')
		'You missed sucka!!'
	  end
  end

  def end_game? 
  	@board.ship_positions.empty?
  end

  def hit_and_misses cell, status 
  	@history[cell] = status
  end
  	
end

