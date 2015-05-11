require 'spec_helper'
require_relative '../lib/decorator'

describe 'Decorator Pattern' do
  let(:common_item) { Item.new }

  context 'magic item' do
    let(:magic_item) { Item.new true }

    it 'has price 3 times more expansive' do
      expect(magic_item.price).to eq(common_item.price * 3)
    end

    it 'has description' do
      expect(magic_item.description).to eq("#{common_item.description}Magic.")
    end
  end

  context 'common_item' do
    it 'has prince' do
      expect(common_item.price).to eq(10)
    end

    it 'has description' do
      expect(common_item.description).to eq('Item.')
    end

    it 'can be used' do
      expect(common_item).to respond_to(:use)
    end
  end
end
