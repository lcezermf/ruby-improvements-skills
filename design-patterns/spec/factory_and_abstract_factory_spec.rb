require 'spec_helper'
require_relative '../lib/factory_and_abstract_factory'

describe 'Factory Pattern' do

  it 'its a party of warriors' do
    party = Party.new(HeroFactory.new)
    party.add_warrior(3)
    expect(party.members.count { |member| member.class == Warrior }).to eq(3)
  end

  it 'its a party of mage' do
    party = Party.new(HeroFactory.new)
    party.add_mage(3)
    expect(party.members.count { |member| member.class == Mage }).to eq(3)
  end

end
