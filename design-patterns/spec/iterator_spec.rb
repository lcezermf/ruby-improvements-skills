require 'spec_helper'
require_relative '../lib/iterator'

describe 'Interator Pattern' do

  describe Inventory do
    let(:inventory) { Inventory.new }

    before do
      item_one = Item.new
      item_one.cost = 20

      item_two = Item.new
      item_two.cost = 10

      inventory.add(item_one)
      inventory.add(item_two)
    end

    it 'add items do collection' do
      expect(inventory.items.size).to eq(2)
    end

    it 'most expansive item' do
      expansive = Item.new
      expansive.cost = 100
      inventory.add(expansive)

      expect(inventory.max).to eq(expansive)
    end

    it 'can iterated and get total' do
      result = inventory.inject(0) { |sum, item| sum + item.cost }
      expect(result).to eq(30)
    end
  end

  describe Item do
    let(:item) { Item.new }

    it 'has cost' do
      expect(item.cost).to eq(0)
    end
  end

end
