require_relative '../../models/robot'

RSpec.describe Robot do
  describe '#placed_on_grid?' do
    context 'when a robot is already placed on grid' do
      it 'returns true' do
        robot = described_class.new
        robot.set_new_position(1,1,'south')

        outcome = robot.placed_on_grid?
        expect(outcome).to be_truthy
      end
    end

    context 'when a robot is not placed on grid' do
      it 'returns false' do
        robot = described_class.new

        outcome = robot.placed_on_grid?
        expect(outcome).to be_falsey
      end
    end
  end

  describe '#set_new_position' do
    context 'when position is passed' do
      it 'updates position of the robot' do
        robot = described_class.new
        robot.set_new_position(1,1,'south')

        expect(robot.x_position).to eq(1)
        expect(robot.y_position).to eq(1)
        expect(robot.direction).to eq('south')
      end
    end
  end

  describe '#left' do
    context 'when left method is called' do
      it 'will rotate the robot direction to left' do
        robot = described_class.new
        robot.set_new_position(1,1,'south')

        robot.left
        expect(robot.direction).to eq('east')
      end
    end
  end

  describe '#right' do
    context 'when left method is called' do
      it 'will rotate the robot direction to right' do
        robot = described_class.new
        robot.set_new_position(1,1,'south')

        robot.right
        expect(robot.direction).to eq('west')
      end
    end
  end

  describe '#report_posiiton' do
    context 'when report_position is called' do
      it 'will print the position of the robot' do
        robot = described_class.new
        robot.set_new_position(1,1,'west')

        expect{ robot.report_position }.to output("\e[0;32;49mOUTPUT: 1,1,WEST\e[0m\n").to_stdout
      end
    end
  end
end