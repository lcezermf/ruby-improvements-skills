require 'spec_helper'
require_relative '../lib/adapter'

describe 'Adapter Pattern' do

  describe 'Finish Quest' do
    it 'rewards hero with xp points' do
      # difficulty * 50 / hero.level
      hero = Hero.new
      quest = Quest.new(5)

      hero.take_quest(quest)
      hero.finish_quest(quest)

      expect(hero.exp).to eq(250)
    end
  end

  describe 'Finish OLD Quest' do
    it 'rewards hero with xp points' do
      hero = Hero.new
      quest = AdapterQuest.new(OldQuest.new, 5)

      hero.take_quest(quest)
      hero.finish_quest(quest)

      expect(hero.exp).to eq(50)
    end
  end

end
