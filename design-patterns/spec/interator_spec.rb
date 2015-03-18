require 'spec_helper'
require_relative '../lib/interator'

describe 'Interator Pattern' do

  describe Inventory do
  end

  describe Item do
    let(:item) { Item.new }

    it 'has cost' do
      expect(item.cost).to eq(0)
    end
  end

end
