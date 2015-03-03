# Behavior Pattern

class Hero
  attr_reader :damage, :health, :skills

  def initialize
    @damage = 10
    @health = 5

    @skills = [:stealth, :driving, :intimidation]
  end

  def print_stats(stats = nil)
    if stats == :skills
      skills.map(&:capitalize).join("\n").concat("\n")
    else
      "Damage: #{damage}\nHealth: #{health}"
    end
  end
end
