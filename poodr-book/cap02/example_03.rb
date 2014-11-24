# Esse método não obedece SRP, pois ele percorre toda a lista de `wheels` e faz o cálculo para cada um deles
def diameters
  wheels.collect do |wheel|
    wheel.rim + (wheel.tire * 2)
  end
end

# Fazendo obedecer SRP
# Agora o método diameters somente percorre a lista enquando o método `diameter` faz o cálculo de cada um deles
def diameters
  wheels.collect { |whee| diameter(wheel) }
end

def diameter(wheel)
  wheel.rim + (wheel.tire * 2)
end

####

# Em alguns casos a quebra de SRP está escondida
# Nesse caso é preciso extrair o calculo para um método de calcula o diametro isoladamente
def gears_inches
  ratio * (rim + (tire * 2))
end

#

def gears_inches
  ratio * diameter
end

def diameter
  rim + (tire * 2)
end

