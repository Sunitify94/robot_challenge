class Grid
  attr_reader :x_position_limit, :y_position_limit

  def initialize
    @x_position_limit = @y_position_limit = 5
  end

  def valid_grid_position?(x_coordinate, y_coordinate)
    x_coordinate.between?(0, @x_position_limit - 1) && y_coordinate.between?(0, @y_position_limit - 1)
  end
end
