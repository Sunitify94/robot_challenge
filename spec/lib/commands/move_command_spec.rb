require_relative '../../../lib/commands/move_command'
require_relative '../../../models/robot'
require_relative '../../../models/grid'
require_relative '../../../lib/errors/invalid_command_error'

RSpec.describe MoveCommand do
  let(:valid_command) { "move" }
  let(:invalid_command) { "move test" }
  let(:robot) { Robot.new }
  let(:grid) { Grid.new }

  describe '#run' do
    context 'when a valid move command is issued facing north' do
      it 'the robot moves one step to north' do
        robot.set_new_position(1,1,'north')

        described_class.new(valid_command, robot, grid).run
        expect(robot.direction).to eq('north')
        expect(robot.x_position).to eq(1)
        expect(robot.y_position).to eq(2)
      end
    end

    context 'when a valid move command is issued facing south' do
      it 'the robot moves one step to south' do
        robot.set_new_position(1,1,'south')

        described_class.new(valid_command, robot, grid).run
        expect(robot.direction).to eq('south')
        expect(robot.x_position).to eq(1)
        expect(robot.y_position).to eq(0)
      end
    end

    context 'when a valid move command is issued facing east' do
      it 'the robot moves one step to east' do
        robot.set_new_position(1,1,'east')

        described_class.new(valid_command, robot, grid).run
        expect(robot.direction).to eq('east')
        expect(robot.x_position).to eq(2)
        expect(robot.y_position).to eq(1)
      end
    end

    context 'when a valid move command is issued facing west' do
      it 'the robot moves one step to west' do
        robot.set_new_position(1,1,'west')

        described_class.new(valid_command, robot, grid).run
        expect(robot.direction).to eq('west')
        expect(robot.x_position).to eq(0)
        expect(robot.y_position).to eq(1)
      end
    end

    context 'when a valid move command is issued robot facing south and at origin' do
      it 'the robot does not move' do
        robot.set_new_position(0,0,'south')

        described_class.new(valid_command, robot, grid).run
        expect(robot.direction).to eq('south')
        expect(robot.x_position).to eq(0)
        expect(robot.y_position).to eq(0)
      end
    end

    context 'when a valid move command is issued robot facing west and at origin' do
      it 'the robot does not move' do
        robot.set_new_position(0,0,'west')

        described_class.new(valid_command, robot, grid).run
        expect(robot.direction).to eq('west')
        expect(robot.x_position).to eq(0)
        expect(robot.y_position).to eq(0)
      end
    end

    context 'when a invalid move command is issued' do
      it 'raises an exception' do
        robot.set_new_position(1,1,'west')

        expect { described_class.new(invalid_command, robot, grid) }.to raise_error(InvalidCommandError)
      end
    end
  end
end