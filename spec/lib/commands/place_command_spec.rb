require_relative '../../../lib/commands/place_command'
require_relative '../../../models/robot'
require_relative '../../../models/grid'
require_relative '../../../lib/errors/invalid_command_arguments_error'

RSpec.describe PlaceCommand do
  let(:valid_command) { "place 1,1,south" }
  let(:invalid_command) { "place 1,1" }
  let(:invalid_arguments) { "place 10,10,south" }
  let(:robot) { Robot.new }
  let(:grid) { Grid.new }

  describe '#run' do
    context 'when a valid place command is issued' do
      it 'the robots position is updated' do
        described_class.new(valid_command, robot, grid).run
        expect(robot.direction).to eq('south')
        expect(robot.x_position).to eq(1)
        expect(robot.y_position).to eq(1)
      end
    end

    context 'when a valid place command with invalid position is issued' do
      it 'the robots position is not updated' do
        described_class.new(valid_command, robot, grid).run

        described_class.new(invalid_arguments, robot, grid).run
        expect(robot.direction).to eq('south')
        expect(robot.x_position).to eq(1)
        expect(robot.y_position).to eq(1)
      end
    end

    context 'when a invalid place command is issued' do
      it 'raises an exception' do
        expect { described_class.new(invalid_command, robot, grid).run }.to raise_error(InvalidCommandArgumentsError)
      end
    end
  end
end