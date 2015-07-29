require_relative 'board'
require_relative 'ship'

class Player

  attr_reader :board

  def initialize
    @board = Board.new
  end

  def fire cell
    if board.hit? cell == true
       board.delete cell
      'Target hit!!'
    else
     'You missed sucka!!'
    end
  end

end
