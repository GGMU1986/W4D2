
require_relative "chess_kit"

class Board
  
  def initialize
    @null_piece = NullPiece.instance 
    @rows = Array.new(8) {Array.new(8, @null_piece)}
    @rows[0][3] = Queen.new
  end

  
  def move_piece(start_pos, end_pos)
    raise "Not a valid position!" unless end_pos.all? { |cord| cord.between?(0, 7) } && start_pos.all? { |cord| cord.between?(0, 7) }
    raise "There is no piece at this position!" if self[start_pos] == null_piece
    chess_piece = self[start_pos]
    self[start_pos] = null_piece
    self[end_pos] = chess_piece
  end

  private

  attr_reader :null_piece, :rows

  def [](pos)
    x,y = pos
    @rows[x][y]
  end

  
  def []=(pos, val)
    x,y = pos
    @rows[x][y] = val
  end
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  p board

  board.move_piece([0, 3], [0, 4])
  p board

  # board.move_piece([0, 1], [0, 4])
  # board.move_piece([8, 3], [0, 4])
  board.move_piece([0, 3], [8, 4])

  
end