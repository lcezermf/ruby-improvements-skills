class MagicItemDecorator
  def initialize(item)
    @item = item
  end

  def price
    @item.price * 3
  end

  def description
    "#{@item.description}Magic."
  end

  def use
    @item.use
  end
end

class MasterpieceItemDecorator
  def initialize(item)
    @item = item
  end

  def price
    @item.price * 2
  end

  def description
    "#{@item.description}Masterpiece."
  end

  def use
    @item.use
  end
end

class Item
  attr_reader :price, :description

  def initialize(is_magic = false, is_masterpiece = false)
    @price = 10
    @description  = 'Item.'

    if is_magic
      @price *= 3
      @description += 'Magic.'
    end
    if is_masterpiece
      @price *= 2
      @description += 'Masterpiece.'
    end
  end

  def use; end
end
