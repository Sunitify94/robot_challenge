require './models/robot'
require './models/grid'
require './lib/commands/place_command'
require './lib/commands/move_command'
require './lib/commands/left_command'
require './lib/commands/right_command'
require './lib/commands/report_command'
require './lib/errors/invalid_command_error'
require './lib/errors/invalid_command_arguments_error'
require './lib/errors/robot_off_grid_error'
require 'colorize'

class CommandRunner
  COMMANDS = {
    'place' => "PlaceCommand",
    'move' => "MoveCommand",
    'left' => "LeftCommand",
    'right' => "RightCommand",
    'report' => "ReportCommand"
  }

  def initialize
    @robot = Robot.new
    @grid = Grid.new
  end

  def run(input)
    @input_arguments = input
    @command = input.split(' ')[0].downcase

    klass_name = fetch_command(@command)
    klass = Object.const_get(klass_name)

    klass.new(@input_arguments, @robot, @grid).run

  rescue InvalidCommandError, InvalidCommandArgumentsError, RobotOffGridError => e
    puts e.message.colorize(:red)
  end

  private

  def fetch_command(command_str)
    klass = COMMANDS[command_str]
    if klass.nil?
      raise InvalidCommandError
    end

    klass
  end
end
