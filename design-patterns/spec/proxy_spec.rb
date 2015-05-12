require 'spec_helper'
require_relative '../lib/proxy'

describe 'Proxy Pattern' do

  it 'delegetas all to real object' do
    pending
    computer = double('computer', queue: [], add: [], execute: true)
    hero = Hero.new
    proxy = ComputerProxy.new(computer, hero)

    allow(computer).to receive(:add)
    proxy.add(double('command'))

    hero.keywords << :computer
    allow(computer).to receive(:execute)
    proxy.execute
  end

  it 'delegetas all to real object with lazy' do
    computer = double('computer', queue: [], add: [], execute: true)
    allow(Computer). to receive(:new).and_return(computer)
    hero = Hero.new
    proxy = ComputerProxy.new(hero)

    allow(computer).to receive(:add)
    proxy.add(double('command'))

    hero.keywords << :computer
    allow(computer).to receive(:execute)
    proxy.execute
  end

  it 'You have no access' do
    pending
    computer = double('computer', queue: [], add: [], execute: true)
    hero = Hero.new #without :computer in keywords
    proxy = ComputerProxy.new(computer, hero)

    expect { proxy.execute }.to raise_error
  end
end
