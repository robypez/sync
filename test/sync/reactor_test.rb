require_relative '../test_helper'
require 'mocha/setup'


describe Sync::Reactor do
  include TestHelper
  
  describe '#perform' do
    it 'starts EventMachine thread and runs block' do
      refute Sync.reactor.running?
      ran_block = false
      Sync.reactor.perform { ran_block = true}
      assert Sync.reactor.running?
      sleep 0.1
      assert ran_block
    end
  end
end
