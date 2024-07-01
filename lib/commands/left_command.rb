require_relative 'base_command'

class LeftCommand < BaseCommand
  def initialize(command, robot, grid)
    super

    if command_has_args?
      raise InvalidCommandError
    end
  end

  def run
    @robot.left
  end
end