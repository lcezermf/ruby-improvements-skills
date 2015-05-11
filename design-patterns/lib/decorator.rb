class Item
  attr_reader :price, :description

  def initialize(is_magic = false)
    @price = 10
    @description  = 'Item.'

    if is_magic
      @price *= 3
      @description += 'Magic.'
    end
  end

  def use; end
end
