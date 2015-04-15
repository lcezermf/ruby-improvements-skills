# require 'singleton'
# class FestivalFactory
#   include Singleton

#   def create_heavy_metal
#     HeavyMetal.new
#   end
#   def create_thrash_metal
#     ThrashMetal.new
#   end
# end

class HeavyMetal; end
class ThrashMetal; end

class FestivalFactory

  @@instance = nil

  def self.instance
    @@instance ||= FestivalFactory.send(:new)
  end

  def create_heavy_metal
    HeavyMetal.new
  end
  def create_thrash_metal
    ThrashMetal.new
  end

  private_class_method :new
end
