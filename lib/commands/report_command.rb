require_relative 'base_command'

class ReportCommand < BaseCommand
  def initialize(command, robot, grid)
    super

    if command_has_args?
      raise InvalidCommandError
    end
  end

  def run
    @robot.report_position
  end
end