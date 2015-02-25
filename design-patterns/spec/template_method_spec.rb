require 'spec_helper'
require_relative '../lib/template_method'

describe 'Template Method Pattern' do
  context 'Default Hero' do
    let(:hero) { Hero.new }

    it 'has default damage rating 10' do
      expect(hero.damage).to eq(10)
    end

    it 'can attack' do
      expect(hero.attack).to eq('Attacked dealing 10 damage')
    end

    it 'requires subclass to implement unique_greeting_ling' do
      expect { hero.greet }.to raise_exception
    end

    it 'require subclass to implement special_attack' do
      expect { hero.special_attack }.to raise_exception
    end
  end

  context 'Warrior' do
    let(:hero) { Warrior.new }

    it 'has default damage rating 15' do
      expect(hero.damage).to eq(15)
    end

    it 'has Strike special ability' do
      expect(hero.abilities).to include(:strike)
    end

    it 'greet other characters' do
      expect(hero.greet).to eq(['Hello', 'Warrior is ready to fight!'])
    end

    it 'special attack' do
      expect(hero.special_attack).to eq('Hadouken!')
    end
  end

  context 'Mage' do
    let(:hero) { Mage.new }

    it 'has default damage rating 7' do
      expect(hero.damage).to eq(7)
    end

    it 'has Magic Arrow special ability' do
      expect(hero.abilities).to include(:magic_arrow)
    end

    it 'greet other characters' do
      expect(hero.greet).to eq(['Hello', 'Mage is ready to fight!'])
    end

    it 'special attack' do
      expect(hero.special_attack).to eq('Kamehameha!')
    end
  end
end
