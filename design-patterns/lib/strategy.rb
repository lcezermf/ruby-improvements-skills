# Behavior Pattern

class Hero
  attr_reader :damage, :health, :skills
  attr_accessor :printer

  def initialize(printer)
    @damage = 10
    @health = 5
    @printer = printer

    @skills = [:stealth, :driving, :intimidation]
  end

  def print_stats(stats = nil)
    printer.print(self)
  end
end

class BattleStats
  def print(context)
    "Damage: #{context.damage}\nHealth: #{context.health}"
  end
end

class SkillsStats
  def print(context)
    context.skills.map(&:capitalize).join("\n").concat("\n")
  end
end
