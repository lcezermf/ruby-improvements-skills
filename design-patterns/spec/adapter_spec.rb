require 'spec_helper'
require_relative '../lib/adapter'

describe 'Adapter Pattern' do

  describe 'Finish quert' do
    it 'rewards hero with xp points' do
      # difficulty * 50 / hero.level
      hero = Hero.new
      quest = Quest.new(5)

      hero.take_quest(quest)
      hero.finish_quest(quest)

      expect(hero.exp).to eq(250)
    end
  end

end
