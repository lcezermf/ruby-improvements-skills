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

  def print_stats
    printer.print(damage, health, skills)
  end
end

class BattleStats
  def print(damage, health, skills)
    "Damage: #{damage}\nHealth: #{health}"
  end
end

class SkillsStats
  def print(damage, health, skills)
    skills.map(&:capitalize).join("\n").concat("\n")
  end
end
