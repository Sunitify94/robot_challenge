require_relative './base_command'
require_relative '../errors/invalid_command_arguments_error'

class PlaceCommand < BaseCommand
  ARGUMENT_REGEX = /^place (0|[1-4]?\d|50),(0|[1-4]?\d|50),(north|south|east|west)$/i

  def initialize(command, robot, grid)
    @command = command
    @robot = robot
    @grid = grid
  end

  def run
    x, y, direction = command_arguments
    return unless @grid.valid_grid_position?(x.to_i,y.to_i)

    @robot.set_new_position(x.to_i, y.to_i, direction)
  end

  private

  def command_arguments
    regex_match = @command.downcase.match(ARGUMENT_REGEX)

    if regex_match.nil?
      raise InvalidCommandArgumentsError
    end

    regex_match.captures
  end
end