require_relative '../../../lib/commands/report_command'
require_relative '../../../models/robot'
require_relative '../../../models/grid'
require_relative '../../../lib/errors/invalid_command_error'
require 'colorize'

RSpec.describe ReportCommand do
  let(:valid_command) { "report" }
  let(:invalid_command) { "report test" }
  let(:robot) { Robot.new }
  let(:grid) { Grid.new }

  describe '#run' do
    context 'when a valid report command is issued' do
      it 'reports the robots position' do
        robot.set_new_position(1,1,'west')

        # Matches with the colour of the output
        expect{ described_class.new(valid_command, robot, grid).run }.to output("\e[0;32;49mOUTPUT: 1,1,WEST\e[0m\n").to_stdout
      end
    end

    context 'when a invalid report command is issued' do
      it 'raises an exception' do
        robot.set_new_position(1,1,'west')

        expect { described_class.new(invalid_command, robot, grid) }.to raise_error(InvalidCommandError)
      end
    end
  end
end