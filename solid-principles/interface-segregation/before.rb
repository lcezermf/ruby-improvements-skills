=begin
A nova implementação é melhor por não há tanta generalização da classe Pai, que agora é quebrada em duas,
sendo assim as respectivas classes filhas herdam somente os métodos que necessitam
=end
class Car
  def open_door
    puts 'opening door...'
  end

  def start_engine
    puts 'vrumm'
  end
end

class CarInternals
  def change_engine
    puts 'tec tecc'
  end
end

class Driver < Car
  def initialize(car)
    @car = car
  end

  def drive
    @car.open_door
    @car.start_engine
  end
end

class Mechanic < CarInternals
  def initialize(car_internals)
    @car_internals = car_internals
  end

  def fix
    @car_internals.change_engine
  end
end