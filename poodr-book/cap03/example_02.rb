# Possui uma dependência explicita, diminui o reuso e deixa o cálculo válido apenas para instâncias de Wheel
# ERRADO
class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def gear_inches
    ratio * Wheel.new(rim, tire).diameter
  end
  def ratio
    chainring / cog.to_f
  end
# ...
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
# ...
end
Gear.new(52, 11, 26, 1.5).gear_inches

#CORRETO
# Agora Gear não se importa com o objeto que ele utiliza, ele apenas quer um objeto que possa responder ao método diameter
# A classe agora se torna menos acoplada a outra facilitando seu reuso e deixando mais reutilizável
class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(chainring, cog, wheel)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end

  def gear_inches
    ratio * wheel.diameter
  end
  def ratio
    chainring / cog.to_f
  end
end
Gear.new(52, 11, Wheel.new(26, 1.5)).gear_inches