
require_relative "chess_kit"

class Board
  
  def initialize
    @null_piece = NullPiece.instance 
    @rows = Array.new(8) {Array.new(8, @null_piece)}
  end

  
  def move_piece(start_pos, end_pos)
    raise "Not a valid position!" unless end_pos.all? { |cord| cord.between?(0, 7) } && start_pos.all? { |cord| cord.between?(0, 7) }
    raise "There is no piece at this position!" if self[start_pos] == null_piece
    chess_piece = self[start_pos]
    self[start_pos] = null_piece
    self[end_pos] = chess_piece
  end
  
  def [](pos)
    x,y = pos
    @rows[x][y]
  end

  
  def []=(pos, val)
    x,y = pos
    @rows[x][y] = val
  end

  def is_null_pos(pos)
    self[pos].is_a?(NullPiece)
  end

  def valid_pos?(pos)
    pos.all? { |cord| cord.between?(0, 7) }
  end

  attr_reader :null_piece, :rows
  private


end

if __FILE__ == $PROGRAM_NAME
  board = Board.new

  # board.move_piece([0, 3], [0, 4])
  # board.move_piece([0, 1], [0, 4])
  # board.move_piece([8, 3], [0, 4])
  # board.move_piece([0, 3], [8, 4])
  bishop = Bishop.new(:white, board, [0,3])
  bishop = Bishop.new(:black, board, [2,2])

  queen = Queen.new(:white, board, [0,0])
  p board
  p queen.moves
  
end