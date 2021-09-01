require_relative "piece.rb"
require_relative "../modules/slideable.rb"

class Queen < Piece
    include Slideable

    def move_dirs
        horizontal_dirs + diagonal_dirs
    end
    
end

if __FILE__ == $PROGRAM_NAME

    queen = Queen.new
    p queen.moves([2,3])
end