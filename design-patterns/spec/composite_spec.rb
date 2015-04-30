require 'spec_helper'
require_relative '../lib/composite'

describe 'Composite Pattern' do

  describe Quest do
    context 'with Encounter and Diplomacy' do
      it 'has reward of 600' do
        quest = Quest.new
        quest.add(Encounter.new)
        quest.add(Diplomacy.new)

        expect(quest.reward).to eq(600)
      end
    end
  end

  describe Encounter do
    it 'has xp reward of 100' do
      expect(Encounter.new.reward).to eq(100)
    end
  end

  describe Puzzle do
    it 'has xp reward of 200' do
      expect(Puzzle.new.reward).to eq(200)
    end
  end

  describe Diplomacy do
    it 'has xp reward of 300' do
      expect(Diplomacy.new.reward).to eq(500)
    end
  end

end
