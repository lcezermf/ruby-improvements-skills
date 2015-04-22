# Creational Pattern

class Party
  attr_reader :members, :factory

  def initialize(factory)
    @members = []
    @factory = factory
  end

  def add_warrior(number)
    number.times { members << factory.create_warrior }
  end

  def add_mage(number)
    number.times { members << factory.create_mage }
  end
end

class HeroFactory
  def create_warrior
    Warrior.new
  end

  def create_mage
    Mage.new
  end
end

# class PartyFactory < Party
#   def create(occupation)
#     if [:warrior, :mage].include?(occupation)
#       self.class.const_get(occupation.to_s.capitalize).new
#     else
#       raise 'Unkown'
#     end
#   end
# end

# class WarriorParty < Party
#   def create
#     Warrior.new
#   end
# end

# class MageParty < Party
#   def create
#     Mage.new
#   end
# end

###

class Hero
  attr_reader :damage, :abilities

  def initialize
    initialize_stats

    @damage    = damage_rating
    @abilities = occupation_abilities
  end

  def attack
    "Attacked dealing #{damage} damage"
  end

  def initialize_stats; end

  def damage_rating
    10
  end

  def occupation_abilities
    []
  end

  def greet
    greeting = ['Hello']
    greeting << unique_greeting_ling
    greeting
  end

  def special_attack
    unique_attack
  end

  def unique_greeting_ling
    raise 'You must define unique_greeting_ling'
  end

  def unique_attack
    raise 'You must define special_attack'
  end
end

class Warrior < Hero
  def damage_rating
    15
  end

  def occupation_abilities
    [:strike]
  end

  def unique_greeting_ling
    'Warrior is ready to fight!'
  end

  def unique_attack
    'Hadouken!'
  end
end

class Mage < Hero
  def damage_rating
    7
  end

  def occupation_abilities
    [:magic_arrow]
  end

  def unique_greeting_ling
    'Mage is ready to fight!'
  end

  def unique_attack
    'Kamehameha!'
  end
end
