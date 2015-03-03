# Behavior Pattern

class Hero
  attr_reader :damage, :health, :skills

  def initialize
    @damage = 10
    @health = 5

    @skills = [:stealth, :driving, :intimidation]
  end
end
