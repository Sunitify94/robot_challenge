require_relative '../../lib/command_runner'
require_relative '../../lib/errors/invalid_command_error'

RSpec.describe CommandRunner do
  let(:command_runner) { CommandRunner.new }
  let(:valid_place_command) { 'place 1,1,south' }
  let(:invalid_place_command) { 'place 1' }
  let(:invalid_command) { 'up' }
  let(:invalid_command_arguments) { 'move up' }

  describe '#run' do
    context 'valid place command is issued' do
      it 'will not raise an exception' do
        expect{ command_runner.run(valid_place_command) }.not_to raise_error
      end
    end

    context 'invalid place command is issued' do
      it 'will print an exception message' do
        expect { command_runner.run(invalid_place_command) }.to output("\e[0;31;49mInvaid Command Arguments!\e[0m\n").to_stdout
      end
    end

    context 'invalid command is issued with extra arguments' do
      it 'will print an exception message' do
        command_runner.run(valid_place_command)

        expect { command_runner.run(invalid_command_arguments) }.to output("\e[0;31;49mInvalid Command!\e[0m\n").to_stdout
      end
    end

    context 'invalid command is issued' do
      it 'will print an exception message' do
        expect { command_runner.run(invalid_command) }.to output("\e[0;31;49mInvalid Command!\e[0m\n").to_stdout
      end
    end
  end
end
