require_relative '../../../lib/commands/left_command'
require_relative '../../../models/robot'
require_relative '../../../models/grid'
require_relative '../../../lib/errors/invalid_command_error'

RSpec.describe LeftCommand do
  let(:valid_command) { "left" }
  let(:invalid_command) { "left test" }
  let(:robot) { Robot.new }
  let(:grid) { Grid.new }

  describe '#run' do
    context 'when a valid left command is issued' do
      it 'rotates the robot to left' do
        robot.set_new_position(1,1,'north')

        described_class.new(valid_command, robot, grid).run
        expect(robot.direction).to eq('west')
      end
    end

    context 'when a invalid left command is issued' do
      it 'raises an exception' do
        robot.set_new_position(1,1,'north')

        expect { described_class.new(invalid_command, robot, grid) }.to raise_error(InvalidCommandError)
      end
    end
  end
end
