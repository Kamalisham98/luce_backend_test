require './base_player'

class YourPlayer < BasePlayer
  attr_accessor :row, :col

  def initialize(**)
    @current_position = { row: 0, col: 0 }
    super
  end

  def next_point(time:)
    # Random start point
    unless time > 0
      # set for current point to compare with next move
      @current_position = {
        row: rand(0..grid.max_row),
        col: rand(0..grid.max_col)
      }
      return @current_position
    end

    # initial next move
    move = nil

    loop do
      move = chosen_next_point

      # to avoid invalid movement
      # (0,0) -> (1,1) is invalid
      # (0.0) -> (1,0) is valid
      # (0.0) -> (0,1) is valid
      break if (move.values.sum - @current_position.values.sum).abs == 1
    end

    # set for current point to compare with next move
    @current_position = move
    move
  end

  def chosen_next_point
    # example current point is 4
    # choose random number one of 4,5, or 6
    chosen_row = rand(@current_position[:row] - 1..@current_position[:row] + 1)
    chosen_col = rand(@current_position[:col] - 1..@current_position[:col] + 1)

    # allowed number is between 0 and max grid
    chosen_col = 0 if chosen_col < 0
    chosen_col = grid.max_col if chosen_col > grid.max_col

    # allowed number is between 0 and max grid
    chosen_row = 0 if chosen_row < 0
    chosen_row = grid.max_row if chosen_row > grid.max_row

    { row: chosen_row, col: chosen_col }
  end

  def grid
    game.grid
  end
end
