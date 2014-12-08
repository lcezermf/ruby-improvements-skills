# Nesse exemplo a classe Trip precisa saber o estados das bicletas e para isso precisa verificar alguns dados da classe `Mechanic`
# porém ela sabe demais sobre a outra classe, realizando chamadas para método que deveria ser privados na outra classe

# ERRADO
class Trip
  def clean_bike(bike)
    Mechanic.clean_bike(bike)
  end
  def pump_tires(bike)
    Mechanic.pump_tires(bike)
  end
  def check_brakes(bike)
    Mechanic.check_brakes(bike)
  end
end

class Mechanic
  def clean_bike(bike)
    # code...
  end
  def pump_tires(bike)
    # code...
  end
  def check_brakes(bike)
    # code...
  end
end

# CORRETO

# A classe `Mechanic` precisa de uma interface pública para ela receber um objeto `bike` e realizar as operações, operações essas que a classe `Trip` não precisa conhecer
class Trip
  def check_bike(bike)
    Mechanic.prepare_bike(bike)
  end
end

def class Mechanic
  def prepare_bike(bike)
    clean_bike(bike)
    pump_tires(bike)
    check_brakes(bike)
  end
  private
  def clean_bike(bike)
  end
  def pump_tires(bike)
  end
  def check_brakes(bike)
  end
end
