require_relative "piece.rb"

class Queen < Piece
    include Slideable

    def initialize

    end

    # def moves
        
    #     all_queen_moves
    # end

    def move_dirs
        possible_dirs = horizontal_dirs + diagonal_dirs
        puts "change"
    end
end

if __FILE__ == $PROGRAM_NAME
    queen = Queen.new
    p queen.moves([0,0])
end