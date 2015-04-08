require 'spec_helper'
require_relative '../lib/factory_and_abstract_factory'

describe 'Factory Pattern' do

  it 'its a party of warriors' do
    party = PartyFactory.new(3, :warrior)
    expect(party.members.count { |member| member.class == Warrior }).to eq(3)
  end

  it 'its a party of mage' do
    party = PartyFactory.new(3, :mage)
    expect(party.members.count { |member| member.class == Mage }).to eq(3)
  end

end
