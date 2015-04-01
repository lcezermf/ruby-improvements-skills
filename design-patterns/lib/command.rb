class Turn
  attr_accessor :moves

  def initialize
    @moves = []
  end

  def make_move(move)
    move.execute
    @moves << move
  end

  def undo_move
    @moves.pop.unexecute
  end

end

class Hero
  attr_accessor :wood, :health, :money

  def initialize
    @wood = 0
    @health = 0
    @money = 0
  end
end

class ChopWoodCommand
  attr_accessor :hero

  def initialize(hero)
    @hero = hero
  end

  def execute
    hero.wood += 10
  end

  def unexecute
    hero.wood -= 10
  end
end

class HealCharacterCommand
  attr_accessor :hero

  def initialize(hero)
    @hero = hero
  end

  def execute
    hero.health += 5
  end

  def unexecute
    hero.health -= 5
  end
end

class GetMoneyCommand
  attr_accessor :hero

  def initialize(hero)
    @hero = hero
  end

  def execute
    hero.money += 50
  end

  def unexecute
    hero.money -= 50
  end
end

####

class Reactor

  def initialize
    @functional = false
    @right_command = %Q{
AmplifyShieldCommand execute!
CalibrateDriverCommand execute!
TestCompilerCommand execute!
InstallRegulatorCommand execute!
}
  end

  def functional?
    @functional
  end

  def fix(result)
    @functional = result == @right_command
  end

end

class Computer
  attr_accessor :queue

  def initialize
    @queue = []
  end

  def add_command(command)
    @queue << command
  end

  def execute
    queue.inject("\n") { |result, command| result + command.execute + "\n" }
  end

end


class AmplifyShieldCommand
  def execute
    "AmplifyShieldCommand execute!"
  end
end

class CalibrateDriverCommand
  def execute
    "CalibrateDriverCommand execute!"
  end
end

class TestCompilerCommand
  def execute
    "TestCompilerCommand execute!"
  end
end

class InstallRegulatorCommand
  def execute
    "InstallRegulatorCommand execute!"
  end
end

