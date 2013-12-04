require_relative 'executor'

TYPE = ENV['TYPE']
CODE_PATH=ENV['CODE_PATH']

describe 'Challenge 3' do
  before do
    @executor = Executor.new(TYPE, CODE_PATH)
  end

  CASES = [
    [['1,1,1', '2,2,2'], '0'],
    [['2,2,5', '2,2,3'], '0'],
    [['1,1,1', '1,1,1'], '1'],
    [['1,1,1', '1,1,1', '0.5,0.5,0.5'], '0,8'],
    [['2,2,5', '2,2,3', '2,2,2'], '1,1'],
    [['1,0.5,2', '1,0.5,1', '0.5,0.5,0.5', '0.3,0.3,0.3'], '0,8,0']
  ]

  CASES.each do |args, result|
    it "returns #{result} to param #{args}" do
      expect(@executor.execute(*args)).to eq result
    end
  end
end
