require_relative '../../models/grid'

RSpec.describe Grid do
  let(:grid) { Grid.new }

  describe '#valid_grid_position?' do
    context 'when a position inside grid is passed' do
      it 'returns true' do
        outcome = grid.valid_grid_position?(1,1)
        expect(outcome).to be_truthy
      end
    end

    context 'when a position outside grid is passed' do
      it 'returns false' do
        outcome = grid.valid_grid_position?(10,10)
        expect(outcome).to be_falsy
      end
    end
  end
end
