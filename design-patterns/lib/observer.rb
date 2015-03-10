# Behavior Pattern

class Hero
  attr_reader :health

  def initialize
    @cursed = false
    @health = 10
  end

  def cursed?
    @cursed
  end

  def damage(hit)
    @health -= hit
  end

  def discover(tile)
    if tile.cursed?
      @cursed = true
      tile.add_cursed(self)
    end
  end
end

class Tile
  attr_reader :cursed_creatures

  def initialize(attrs = {})
    @cursed = attrs.fetch(:cursed, false)
    @cursed_creatures = []
  end

  def cursed?
    @cursed
  end

  def add_cursed(creature)
    @cursed_creatures << creature
  end

  def activate_curse
    cursed_creatures.each { |creature| creature.damage(4) }
  end
end
