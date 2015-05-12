# Structural Pattern
require 'forwardable'

class ItemDecorator
  extend Forwardable

  def_delegator :@item, :use

  def initialize(item)
    @item = item
  end
end

class MagicItemDecorator < ItemDecorator
  def price
    @item.price * 3
  end

  def description
    "#{@item.description}Magic."
  end
end

class MasterpieceItemDecorator < ItemDecorator
  def price
    @item.price * 2
  end

  def description
    "#{@item.description}Masterpiece."
  end
end

class Item
  attr_reader :price, :description

  def initialize
    @price = 10
    @description  = 'Item.'
  end

  def use; end
end
