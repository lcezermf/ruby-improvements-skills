require 'spec_helper'
require_relative '../lib/factory_and_abstract_factory'

describe 'Factory Pattern' do

  it 'its a party of warriors' do
    party = Party.new(3)
    expect(party.members.count { |member| member.class == Warrior }).to eq(3)
  end

end
