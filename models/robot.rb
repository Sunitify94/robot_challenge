class Robot
  attr_reader :x_position, :y_position, :direction

  DIRECTIONS = ['north', 'east', 'south', 'west']

  def initialize
    @x_position = @y_position = -1
    @direction = 'north'
  end

  def placed_on_grid?
    @x_position != -1 && @y_position != -1
  end

  def set_new_position(x, y, direction)
    @x_position = x
    @y_position = y
    @direction = direction
  end

  def left
    current_index = DIRECTIONS.index(@direction)
    @direction = face_left(current_index)
  end

  def right
    current_index = DIRECTIONS.index(@direction)
    @direction = face_right(current_index)
  end

  def report_position
    puts "OUTPUT: #{@x_position},#{@y_position},#{@direction.upcase}".colorize(:green)
  end

  private

  def face_left(current_index)
    current_index -= 1
    current_index < 0 ? DIRECTIONS.last : DIRECTIONS[current_index]
  end

  def face_right(current_index)
    current_index += 1
    current_index > DIRECTIONS.size - 1 ? DIRECTIONS.first : DIRECTIONS[current_index]
  end
end
