class Piece
  attr_reader :color
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def empty?
    self.is_a?(NullPiece)
  end

  
end
