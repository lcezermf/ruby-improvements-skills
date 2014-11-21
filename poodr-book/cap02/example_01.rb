# Esconder Variáveis de Instância

# Errado
class Gear
  def initialize(chainring, cog)
    @chainring, @cog = chainring, cog
  end
  def ratio
    @chainring * @cog
  end
end

# Correto
class Gear
  attr_accessor :chainring, :cog
  def initialize(chainring, cog)
    @chainring, @cog = chainring, cog
  end
  def ratio
    chainring * cog
  end
end