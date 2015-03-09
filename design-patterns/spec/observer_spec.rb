require 'spec_helper'
require_relative '../lib/observer'

describe 'Observer Pattern' do

  describe Hero do
    it 'its cursed then discovers cursed Tile' do
      hero = Hero.new
      tile = Tile.new cursed: true
      hero.discover(tile)

      expect(hero.cursed?).to be_truthy
    end

    it 'its not cursed when discovers title without curse' do
      hero = Hero.new
      tile = Tile.new
      hero.discover(tile)

      expect(hero.cursed?).to be_falsy
    end
  end

  describe Tile do
    it 'its not cursed by default' do
      tile = Tile.new

      expect(tile.cursed?).to be_falsy
    end

    it 'can create as cursed' do
      tile = Tile.new cursed: true

      expect(tile.cursed?).to be_truthy
    end
  end
end
