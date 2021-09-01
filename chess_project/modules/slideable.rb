module Slideable
  HORIZONTAL_DIRS = [
    [0, 1],
    [0, -1],
    [1, 0],
    [-1, 0]
  ]

  DIAGONAL_DIRS = [
    [1, 1],
    [-1,-1],
    [1, -1],
    [-1, 1]
  ]


  def horizontal_dirs
    HORIZONTAL_DIRS
    
  end
  
  def diagonal_dirs
    DIAGONAL_DIRS
  end
  
  
  
  def moves(pos) # => [0, 0]
    piece_dirs = self.move_dirs  # rook.move_dirs ==> :roo
    # p piece_dirs
    possible_moves = []
    cur_x, cur_y = pos
    piece_dirs.each do |(dx, dy)|
      # grow_unblocked_moves_dir(dx,dy)
      new_position = [cur_x + dx, cur_y + dy]
      possible_moves << new_position if new_position.all? { |coord| coord.between?(0,7)}
    end
    possible_moves
      
  end


  private

  def move_dirs
    raise NotImplementedError
  end

  def grow_unblocked_moves_dir(dx,dy)
    #[[0, 1], [1, 0], [1, 1]]
  end
end