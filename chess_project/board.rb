
require_relative "chess_kit"

class Board

  BACK_ROW = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook].freeze
  
  def initialize
    @null_piece = NullPiece.instance 
    @rows = Array.new(8) {Array.new(8, @null_piece)}
  end


  
  def move_piece(start_pos, end_pos)
    raise "Not a valid position!" unless valid_pos?(start_pos) && valid_pos?(end_pos)
    raise "There is no piece at this position!" if is_null_pos(start_pos)
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

  def add_piece(piece, pos)
    self[pos] = piece
  end

  def populate_board
    # @rows[0].each_with_index { |box, i| BACK_ROW[i].new }
    BACK_ROW.each_with_index do |piece_class, i|
      @rows[0][i] = piece_class.new(:white, self, [0, i])
      # p @row[0]
      @rows[1][i] = Pawn.new(:white, self, [1, i])
      # @rows[7][i] = BACK_ROW.reverse[i].new(:black, self, [7, i])
      @rows[6][i] = Pawn.new(:black, self, [6, i])
      # @rows.each do |row|
      #   row[i]
      # end
    end
  end

  private
  attr_reader :null_piece, :rows


end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  board.populate_board
  # board.move_piece([0, 3], [0, 4])
  # board.move_piece([0, 1], [0, 4])
  # board.move_piece([8, 3], [0, 4])
  # board.move_piece([0, 3], [8, 4])
  # bishop1 = Bishop.new(:white, board, [0,3])
  # bishop2 = Bishop.new(:black, board, [2,2])

  # queen = Queen.new(:white, board, [0,0])

  # board.add_piece(bishop1, [0,3] )
  # board.add_piece(bishop2, [2,2] )
  # board.add_piece(queen, [0,0] )

  p board
  # p queen.moves
  
end