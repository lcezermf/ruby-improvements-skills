#Isolando as dependências

# O Método #gear_inches instância um novo Wheel, no caso de não ser possível implementar usando a técnica de Injeção de dependência
# As melhores opções são isolar a criação da instância

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
end

# Alternativa 1
# Deixar explícita a dependência na inicialização do objeto Gear
class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @wheel = Wheel.new(rim, tire)
  end

  def gear_inches
    ratio * wheel.diameter
  end
  def ratio
    chainring / cog.to_f
  end
end

# Alternativa 2
class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def gear_inches
    ratio * wheel.diameter
  end
  def ratio
    chainring / cog.to_f
  end
  def wheel
    @wheel ||= Wheel.new(rim, tire)
  end

end

#############################
#############################
#############################

#Isolando chamada para métodos externos
# Nessa situação ocorre apenas uma chamada simples de Wheel#diameter dentro do método Gear#gear_inches, porém se o método #gear_inches fosse algo
# mais complexo e outros pontos de Gear utilizassem Wheel#diameter, seria necessário que Gear tivesse sua própria implementação de #diameter

# É preciso isolar a chamada de Wheel#diameter
class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @wheel = Wheel.new(rim, tire)
  end
  def gear_inches
    ratio * wheel.diameter
  end
end

# Isolando a chamada em um método dentro de Gear
# Agora em outros lugares de Gear que precisarem de diameter é só executar a chamada interna
class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @wheel = Wheel.new(rim, tire)
  end
  def gear_inches
    ratio * diameter
  end
  private
  def diameter
    wheel.diameter
  end
end

#############################
#############################
#############################

### Remover a depêndencia de ordem de argumentos

# A classe depende de muitos argumentos em determinada ordem, caso os argumentos sejam passados de forma errada, ocasionará um erro na classe
# e qualquer mudança a argumentos irá se propagar por todos os pontos onde a classe for chamada

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
end

Gear.new(1, 1, 1, 1)

# Usando um hash de argumentos
class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(arguments = {})
    @chainring = arguments[:chainring]
    @cog = arguments[:cog]
    @rim = arguments[:rim]
    @tire = arguments[:tire]
  end

  def gear_inches
    ratio * Wheel.new(rim, tire).diameter
  end
  def ratio
    chainring / cog.to_f
  end
end
Gear.new(chainring: 1, cog: 1, rim: 1, tire: 1)

#############################
#############################
#############################

# Valores Default de forma explícita

# forma mais simples
# Porém o uso de `||` não é muito eficiente e caso args[:one] seja `false` ou `nil` a condição irá retornar `true`
def some(args)
  @arg  = args[:one] || 1
  @argg = args[:two] || 2
end

# forma mais segura e previne o error acima
def some(args)
  @arg  = args.fetch(:one, 1)
  @argg = args.fetch(:two, 2)
end

# usando método privado com merge
def some(args)
  params = defaults.merge(args)
  @name = params[:name]
end
private
def defaults
  { name: 'Luiz Cezer', age: 24 }
end

#############################
#############################
#############################

# Isolar multiparametros da inicialização

module SomeFramework
  class Gear
    def initialize(:chainring, :cog)
      @chainring = chainring
      @cog = cog
    end
  end
end

module WrapperGear
  def self.gear
    SomeFramework::Gear.new(args[:chainring], args[:cog])
  end
end