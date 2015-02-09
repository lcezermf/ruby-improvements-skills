=begin
Classe Product possui a lógica de calculo do valor com desconto,
caso seja necessário mudar o valor de desconto de 10% para 20% ou mudar a regra será preciso alterar essa classe,
mas Product não deve saber dessa lógica e sim apenas guardar dados de Product
=end
class Product
  attr_reader :price

  def initialize(name, price)
    @name  = name
    @price = price
  end

  # necessário uma classe p/ realizar encapsular a lógica de cálculo de desconto
  def price_with_discount
    @price * 0.90
  end
end