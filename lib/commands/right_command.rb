require_relative 'base_command'

class RightCommand < BaseCommand
  def initialize(command, robot, grid)
    super

    if command_has_args?
      raise InvalidCommandError
    end
  end

  def run
    @robot.right
  end
end