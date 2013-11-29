require_relative 'executor'

TYPE = ENV['TYPE']
CODE_PATH=ENV['CODE_PATH']

describe 'Challenge 2' do
  before do
    @executor = Executor.new(TYPE, CODE_PATH)
  end

  CASES = [
    [['carte', 'cater'], '1'],
    [['carte', 'cater', 'crate'], '3'],
    [['carte', 'cater', 'crate', 'react'], '6'],
    [['carte', 'cater', 'apers', 'asper', 'soco'], '2'],
    [[], '0'],
    [['uno', 'dos'], '0'],
    [['roce', 'cero', 'roce', "'Den al gran guia'", "'Angel guardian'"], '4'],
    [['uno'],'0'],
    [['Otto', 'Otto'], '1'],
    [['One', "'en O'", 'Once', 'ceno'], '2']
  ]

  CASES.each do |args, result|
    it "returns #{result} to param #{args}" do
      expect(@executor.execute(*args)).to eq result
    end
  end
end
