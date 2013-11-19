require 'minitest/autorun'
require_relative 'executor'

TYPE = ENV['TYPE']
CODE_PATH=ENV['CODE_PATH']

describe 'Challenge 1' do
  before do
    @executor = Executor.new(TYPE, CODE_PATH)
  end

  CASES = [
    ['0', '0'],
    ['1', '1'],
    ['2', '1'],
    ['3', '2'],
    ['4', '3'],
    ['5', '5'],
    ['6', '8'],
    ['7', '13'],
    ['8', '21'],
    ['9', '34'],
    ['10', '55'],
    ['11', '89'],
    ['12', '144'],
    ['13', '233'],
    ['14', '377'],
    ['15', '610'],
    ['16', '987'],
    ['17', '1597'],
    ['18', '2584'],
    ['19', '4181'],
    ['20', '6765'],
    ['21', '10946'],
    ['22', '17711'],
    ['23', '28657'],
    ['24', '46368'],
    ['25', '75025'],
    ['26', '121393'],
    ['27', '196418'],
    ['28', '317811'],
    ['29', '514229'],
    ['30', '832040']
  ]

  CASES.each do |args, result|
    it "returns #{result} to param #{args}" do
      @executor.execute(*args).must_equal result
    end
  end
end
