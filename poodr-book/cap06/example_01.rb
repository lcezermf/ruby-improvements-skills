class Bicycle
  attr_reader :size, :tape_color

  def initialize(args)
    @size       = args[:size]
    @tape_color = args[:tape_color]
  end

  def spares
    { chain: '10-speed', tire_size: '23', tape_color: tape_color }
  end
end
bike = Bicycle.new(size: 'M', tape_color: 'red')


### Adicionando múltiplos tipos.

# Aqui se faz o uso de um antipattern para selecionar os spares de cada bike.
# Quem toma a decisão dos spares para cada tipo de bike é um if dentro do método spares

class Bicycle
  attr_reader :style, :size, :tape_color, :front_shock, :rear_shock

  def initialize(args)
    @style       = args[:style]
    @size        = args[:size]
    @tape_color  = args[:tape_color]
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
  end

  def spares
    # Esse tipo de implementação pode indicar que o Uso de herança
    if style == :road
      { chain: '10-speed', tire_size: '23', tape_color: tape_color }
    else
      { chain: '10-speed', tire_size: '2.1', rear_shock: rear_shock }
    end
  end
end

bike = Bicycle.new(style: :mountain, size: 'S', front_shock: 'Manitou', rear_shock: 'Fox')

### Uso errado de herança

# A class MountainBike extende comportamentos que não deveria saber ou não fazem sentido
# A implementação de Bicycle é uma implementação abstrada que não permito que a classe tenha classes filhas, ela combina comportamentos de todas as bicicletas com alguns comportamentos especificos p/ Road Bikes.
# Alguns comportamentos de MountainBike fazem sentido serem herdados de Bicycle, outros não.
class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
    super(args)
  end

  def spares
    super.merge(rear_shock: rear_shock)
  end
end
