require_relative "piece.rb"
require_relative "../modules/slideable.rb"

class Bishop < Piece
    include Slideable

    def move_dirs
        diagonal_dirs
    end
    
end