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
      possible_moves += grow_unblocked_moves_dir(dx,dy) 
    end

    possible_moves
    
  end
  
  
  private
  
  def move_dirs
    raise NotImplementedError
  end
  
  def grow_unblocked_moves_dir(dx,dy)
    
    moves_in_dir = []
    could_go_further = true
    cur_x, cur_y = @pos
    step = 1
    
    while could_go_further
    
      new_position = [cur_x + step * dx, cur_y + step * dy]
      # print "piece "
      # p @board[new_position]
      if @board.valid_pos?(new_position) && @board.is_null_pos(new_position)
        moves_in_dir << new_position
        step += 1
      elsif @board.valid_pos?(new_position) && @board[new_position].color != @color
        moves_in_dir << new_position
        could_go_further = false
      else
        could_go_further = false
      end

    end

    moves_in_dir
  end
end