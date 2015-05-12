require 'spec_helper'
require_relative '../lib/proxy'

describe 'Proxy Pattern' do

  it 'delegetas all to real object' do
    computer = double('computer', queue: [], add: [], execute: true)
    proxy = ComputerProxy.new(computer)

    allow(computer).to receive(:add)
    proxy.add(double('command'))

    allow(computer).to receive(:execute)
    proxy.execute
  end
end
