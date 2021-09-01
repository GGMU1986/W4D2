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
  
  
  
  def moves

    possible_moves = []
    move_dirs.each do |(dx, dy)|
      
      moves_in_dir = grow_unblocked_moves_dir(dx,dy)
      possible_moves += moves_in_dir 
    end
    possible_moves
    
  end
  
  
  private
  
  def move_dirs
    raise NotImplementedError
  end
  
  def grow_unblocked_moves_dir(dx,dy)
    # p dx, dy
    moves_in_dir = []
    could_go_further = true
    cur_x, cur_y = @pos
    step = 1
    while could_go_further
    
      new_position = [cur_x + step * dx, cur_y + step * dy]
      if new_position.all? { |coord| coord.between?(0,7)} && @board[new_position] == @board[@null_piece]
        moves_in_dir << new_position
        step += 1
      else
        could_go_further = false
      end
    end
    moves_in_dir
  end
end