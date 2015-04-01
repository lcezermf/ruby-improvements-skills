require 'spec_helper'
require_relative '../lib/command'

describe 'Command Pattern' do

  describe 'Undo' do
    it 'can be undone' do
      hero = Hero.new
      turn = Turn.new
      wood = ChopWoodCommand.new(hero)
      health = HealCharacterCommand.new(hero)
      money = GetMoneyCommand.new(hero)

      turn.make_move(wood)
      turn.make_move(health)

      expect(hero.wood).to eq(10)
      expect(hero.health).to eq(5)

      turn.undo_move
      expect(hero.health).to eq(0)

      turn.undo_move
      expect(hero.wood).to eq(0)
    end
  end

  describe Reactor do
    it 'it fixed if commands are executed in the right order' do
      computer = Computer.new
      computer.add_command(AmplifyShieldCommand.new)
      computer.add_command(CalibrateDriverCommand.new)
      computer.add_command(TestCompilerCommand.new)
      computer.add_command(InstallRegulatorCommand.new)

      reactor = Reactor.new
      expect(reactor.functional?).to be_falsy

      reactor.fix(computer.execute)
      expect(reactor.functional?).to be_truthy
    end
  end

  describe Computer do
    let(:computer) { Computer.new }

    before do
      computer.add_command(CalibrateDriverCommand.new)
      computer.add_command(TestCompilerCommand.new)
    end

    it 'can add commands to queue' do
      expect(computer.queue.size).to eq(2)
    end

    it 'execute commands in order' do
      result = %Q{
CalibrateDriverCommand execute!
TestCompilerCommand execute!
}

      expect(computer.execute).to eq(result)
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
