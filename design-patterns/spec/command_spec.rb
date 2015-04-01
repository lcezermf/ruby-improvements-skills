require 'spec_helper'
require_relative '../lib/command'

describe 'Command Pattern' do

  describe Computer do
    let(:computer) { Computer.new }

    before do
      computer.add_command(CalibrateDriverCommand.new)
      computer.add_command(TestCompilerCommand.new)
    end

    it 'can add commands to queue' do
      expect(computer.queue.size).to eq(2)
    end
  end

  describe 'Commands' do
    describe AmplifyShieldCommand do
      it 'amplifies shield' do
        command = AmplifyShieldCommand.new

        expect(command.execute).to eq("AmplifyShieldCommand execute!")
      end
    end

    describe CalibrateDriverCommand do
      it 'calibrates driver' do
        command = CalibrateDriverCommand.new

        expect(command.execute).to eq("CalibrateDriverCommand execute!")
      end
    end

    describe TestCompilerCommand do
      it 'test compiler' do
        command = TestCompilerCommand.new

        expect(command.execute).to eq("TestCompilerCommand execute!")
      end
    end

    describe InstallRegulatorCommand do
      it 'install regulator' do
        command = InstallRegulatorCommand.new

        expect(command.execute).to eq("InstallRegulatorCommand execute!")
      end
    end
  end
end
