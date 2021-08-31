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


  def horizontal_dirs(pos)
    
    possible_moves = []
    cur_x, cur_y = pos
    HORIZONTAL_DIRS.each do |(dx, dy)|
      # grow_unblocked_moves_dir(dx,dy)
      new_position = [cur_x + dx, cur_y + dy]
      possible_moves << new_position if new_position.all? { |coord| coord.between?(0,7)}
    end

  end

  def diagonal_dirs(pos)
  end



  def moves(pos)
    piece_dirs = self.move_dirs  # rook.move_dirs ==> :rook

    if piece_dirs == :rook


  end

  private

  def grow_unblocked_moves_dir(dx,dy)
    
  end
end