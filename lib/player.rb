require_relative 'board'
require_relative 'ship'

class Player

  attr_reader :board

  def initialize
    @board = Board.new
  end

  def fire cell
    return 'Target hit!!' if board.hit?(cell) == true
     'You missed sucka!!'
  end

end
