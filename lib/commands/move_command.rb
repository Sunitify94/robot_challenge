require_relative 'base_command'

class MoveCommand < BaseCommand
  MOVE_NORTH = [0,1]
  MOVE_SOUTH = [0,-1]
  MOVE_EAST = [1,0]
  MOVE_WEST = [-1,0]

  def initialize(command, robot, grid)
    super

    if command_has_args?
      raise InvalidCommandError
    end
  end

  def run
    x, y = calculate_new_position
    return unless @grid.valid_grid_position?(x,y)

    @robot.set_new_position(x, y, @robot.direction)
  end

  private

  def calculate_new_position
    case @robot.direction
    when "north"
      [@robot.x_position + MOVE_NORTH[0], @robot.y_position + MOVE_NORTH[1]]
    when "south"
      [@robot.x_position + MOVE_SOUTH[0], @robot.y_position + MOVE_SOUTH[1]]
    when "east"
      [@robot.x_position + MOVE_EAST[0], @robot.y_position + MOVE_EAST[1]]
    when "west"
      [@robot.x_position + MOVE_WEST[0], @robot.y_position + MOVE_WEST[1]]
    else
      [-1, -1]
    end
  end

end
