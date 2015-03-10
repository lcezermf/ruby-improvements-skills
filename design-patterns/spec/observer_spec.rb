require 'spec_helper'
require_relative '../lib/observer'

describe 'Observer Pattern' do

  describe Hero do
    let(:hero) { Hero.new }

    it 'its cursed then discovers cursed Tile' do
      tile = Tile.new cursed: true
      hero.discover(tile)

      expect(hero.cursed?).to be_truthy
    end

    it 'its not cursed when discovers title without curse' do
      tile = Tile.new
      hero.discover(tile)

      expect(hero.cursed?).to be_falsy
    end

    it 'it has default health eq to 10' do
      expect(hero.health).to eq(10)
    end

    it 'can be damaged' do
      hero.damage(6)
      expect(hero.health).to eq(4)
    end
  end

  describe Tile do
    it 'activetes curse' do
      hero = Hero.new
      tile = Tile.new cursed: true, hero: hero

      tile.activate_curse
      expect(hero.health).to eq(6)
    end

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
