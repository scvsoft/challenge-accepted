require 'minitest/autorun'
require_relative 'executor'

TYPE = ENV['TYPE']
CODE_PATH=ENV['CODE_PATH']

describe 'Challenge 3' do
  before do
    @executor = Executor.new(TYPE, CODE_PATH)
  end

  CASES = [
    [['1,1,1', '1,1,1'], '1'],
    [['1,1,1', '1,1,1', '0.5,0.5,0.5'], '0,8'],
    [['1,0.5,2', '1,0.5,1', '0.5,0.5,0.5', '0.3,0.3,0.3'], '0,8,0']
  ]

  CASES.each do |args, result|
    it "returns #{result} to param #{args}" do
      @executor.execute(*args).must_equal result
    end
  end
end
