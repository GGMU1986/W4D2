
require_relative "chess_kit"

class Board
  
  def initialize()
    @rows = Array.new(8) {Array.new(8)} #NullPiece.new
 
  end

  
  def move_piece(start_pos, end_pos)
    chess_piece = self[start_pos]
    self[start_pos] = NullPiece
    self[end_pos] = chess_piece
  end

  private

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
end