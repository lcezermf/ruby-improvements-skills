# Behavior Pattern

class Hero
  attr_reader :damage

  def initialize(occupation = nil)
    @damage = occupation == :warrior ? 15 : 10
  end

  def attack
    "Attacked dealing #{damage} damage"
  end

end
