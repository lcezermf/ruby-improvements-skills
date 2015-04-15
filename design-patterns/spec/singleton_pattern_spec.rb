require 'spec_helper'
require_relative '../lib/singleton_pattern'

describe 'Singleton Pattern' do
  let(:factory) { FestivalFactory.instance }

  it 'needs to be a FestivalFactory instance' do
    expect(factory).to be_instance_of(FestivalFactory)
  end

  it 'needs to be the same instance for another object' do
    another_factory = FestivalFactory.instance

    expect(another_factory).to eq(factory)
  end

  it 'deny call .new method' do
    expect { FestivalFactory.new }.to raise_exception
  end
end
