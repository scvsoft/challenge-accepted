require 'minitest/autorun'
require_relative 'executor'

TYPE = ENV['TYPE']
CODE_PATH=ENV['CODE_PATH']

describe 'Challenge 3' do
  before do
    @executor = Executor.new(TYPE, CODE_PATH)
  end

  CASES = [
    [[[1,1,1], [[1,1,1]]], '[1]'],
    [[1,1,1], [[1,1,1],[.5,.5,.5]], '[0,8]'],
    [[[1,.5,2], [[1,.5,1],[.5,.5,.5],[.3,.3,.3]]], '[0,8,0]']
  ]

  CASES.each do |args, result|
    it "returns #{result} to param #{args}" do
      @executor.execute(*args).must_equal result
    end
  end
end
