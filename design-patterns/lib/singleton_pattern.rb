require 'singleton'

class HeavyMetal; end
class ThrashMetal; end

class FestivalFactory
  include Singleton

  def create_heavy_metal
    HeavyMetal.new
  end
  def create_thrash_metal
    ThrashMetal.new
  end
end
