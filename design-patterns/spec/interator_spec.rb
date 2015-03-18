require 'spec_helper'
require_relative '../lib/interator'

describe 'Interator Pattern' do

  describe Inventory do
    it 'add items do collection' do
      item_one = Item.new
      item_one.cost = 20

      item_two = Item.new
      item_two.cost = 10

      inventory = Inventory.new
      inventory.add(item_one)
      inventory.add(item_one)

      expect(inventory.items.size).to eq(2)
    end
  end

  describe Item do
    let(:item) { Item.new }

    it 'has cost' do
      expect(item.cost).to eq(0)
    end
  end

end
