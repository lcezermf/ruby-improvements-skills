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

  def update
    damage(4)
  end

  def discover(tile)
    if tile.cursed?
      @cursed = true
      tile.add_observer(self)
    end
  end
end

# module Observable
#   attr_reader :observers

#   def initialize(attrs = {})
#     @observers = []
#   end

#   def add_observer(observer)
#     @observers << observer
#   end

#   def notify_observers
#     observers.each { |observer| observer.update }
#   end
# end

require "observer"

class Tile
  include Observable

  def initialize(attrs = {})
    @cursed = attrs.fetch(:cursed, false)
  end

  def cursed?
    @cursed
  end

  def activate_curse
    change
    notify_observers
  end
end
