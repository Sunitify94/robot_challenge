require_relative '../../../lib/commands/right_command'
require_relative '../../../models/robot'
require_relative '../../../models/grid'
require_relative '../../../lib/errors/invalid_command_error'

RSpec.describe RightCommand do
  let(:valid_command) { "right" }
  let(:invalid_command) { "right test" }
  let(:robot) { Robot.new }
  let(:grid) { Grid.new }

  describe '#run' do
    context 'when a valid right command is issued' do
      it 'rotates the robot to right' do
        robot.set_new_position(1,1,'west')

        described_class.new(valid_command, robot, grid).run
        expect(robot.direction).to eq('north')
      end
    end

    context 'when a invalid right command is issued' do
      it 'raises an exception' do
        robot.set_new_position(1,1,'west')

        expect { described_class.new(invalid_command, robot, grid) }.to raise_error(InvalidCommandError)
      end
    end
  end
end