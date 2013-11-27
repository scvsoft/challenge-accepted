require_relative 'executor'

TYPE = ENV['TYPE']
CODE_PATH=ENV['CODE_PATH']

describe 'Challenge 4' do
  before do
    @executor = Executor.new(TYPE, CODE_PATH)
  end

  CASES = [
    [[1,1,2], '0'],
    [[2,1,1], '0'],
    [[1,1,1], '0'],
    [[1,2,1], '0'],
    [[2,1,2], '1'],
    [[4,3,2,1,4,1,2,3,4], '12'],
    [[2,5,1,2,3,4,7,7,6], '10'],
    [[2,5,1,3,1,2,1,7,7], '17'],
    [[7,2,7,4,7,1,7,3,7], '18'],
    [[2,5,1,2,3,4,7,5,6], '11']
  ]

  CASES.each do |args, result|
    it "returns #{result} to param #{args}" do
      expect(@executor.execute(*args)).to eq result
    end
  end
end
