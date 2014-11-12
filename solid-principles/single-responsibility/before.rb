=begin
Agora a classe Product não realiza mais o cálculo de desconto e sim delega esse cálculo p/ a classe responsável.
=end
class Product
  attr_reader :price

  def initialize(name, price)
    @name  = name
    @price = price
  end

  def price_with_discount
    DiscountCalculator.new(price).calculate
  end
end

class DiscountCalculator
  DiscountPercentage = 0.90

  def initialize(value)
    @value = value
  end

  def calculate
    @value * DiscountPercentage
  end
end