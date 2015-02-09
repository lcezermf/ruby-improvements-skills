=begin
Esse modelo fere o LSP pois as classes derivadas(filhas) não podem ser substituidas pela classe base(pai),
pois cada uma delas implementa seu próprio método para salvar.
=end
class Person; end

class NaturalPerson < Person
  def save_natural() end
end

class JuridicalPerson < Person
  def save_juridical() end
end

# Caso tenhamos uma lista de Person, não poderiamos salvar cada um deles, sem antes fazer uma checagem de tipo.
persons = 10.times.map { Person.new }
persons.each do |person|
  person.save_natural if person.is_a?(NaturalPerson)
  person.save_juridical if person.is_a?(JuridicalPerson)
end

=begin
Outro exemplo onde fere o LSP pois ao percorrer a lista de 'Animal', a classe pai não implementa o método #run
=end

class Animal
  def walk
    puts 'walking...'
  end
end

class Cat < Animal
  def run
    puts 'running like a cat'
  end
end

class Dog < Animal
  def run
    puts 'running like a dog'
  end
end

animals = 10.times.map { Animal.new }
animals.map &:run