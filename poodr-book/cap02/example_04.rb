# A classe `Gear` possui alguns comportamentos e cálculos referentes a `Wheel`, é necessário a extração para outra classe
# porém por alguma decisão de design essa classe não poderá ser criada, mas ainda assim é possivel melhorar o comportamento da classe.
# como a implementação é temporária e possui somente um método é possível fazer o uso de `Struct`
class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @wheel = Wheel.new(rim, tire)
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
  end

  Wheel = Struct.new(:rim, :tire) do
    def diameter
      rim + (tire * 2)
    end
  end
end

# Agora que é preciso uma implementação real é preciso extrair para um classe real

class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(chainring, cog, wheel = nil)
    @chainring = chainring
    @cog       = cog
    @wheel     = wheel
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
  end
end

class Wheel
  attr_reader :rim, :tire
  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end
end

# As duas classes agora obedecem SRP
