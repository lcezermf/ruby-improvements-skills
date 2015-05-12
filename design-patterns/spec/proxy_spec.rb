require 'spec_helper'
require_relative '../lib/proxy'

describe 'Proxy Pattern' do

  it 'delegetas all to real object' do
    computer = double('computer', queue: [], add: [], execute: true)
    hero = Hero.new
    proxy = ComputerProxy.new(computer, hero)

    allow(computer).to receive(:add)
    proxy.add(double('command'))

    hero.keywords << :computer
    allow(computer).to receive(:execute)
    proxy.execute
  end

  it 'You have no access' do
    computer = double('computer', queue: [], add: [], execute: true)
    hero = Hero.new #without :computer in keywords
    proxy = ComputerProxy.new(computer, hero)

    expect { proxy.execute }.to raise_error
  end
end
