class BaseCommand
  def initialize(command, robot, grid)
    @command = command
    @robot = robot
    @grid = grid

    unless @robot.placed_on_grid?
      raise RobotOffGridError
    end
  end

  def run
    raise NotImplementedError
  end

  private

  def command_has_args?
    @command.split(' ').size > 1
  end
end
