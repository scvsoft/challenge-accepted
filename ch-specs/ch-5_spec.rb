require 'minitest/autorun'
require_relative 'executor'

TYPE = ENV['TYPE']
CODE_PATH=ENV['CODE_PATH']

describe 'Challenge 5' do
  before do
    @executor = Executor.new(TYPE, CODE_PATH)
  end

  CASES = [
    [['Hello'], "H\ne\nl\nl\no"],
    [[''], ""],
    [['Hello', 'World'], "HW\neo\nlr\nll\nod"],
    [['I', 'am', 'new', 'here'], "Ianh\n mee\n  wr\n   e"],
    # Executor removes leading and trailing whitespace, so no spaces at the end.
    [['One', 'ring', 'to', 'rule', 'them', 'all'], "Ortrta\nniouhl\nen lel\n g em"],
  ]

  CASES.each do |args, result|
    it "returns #{result} to param #{args}" do
      @executor.execute(*args).must_equal result
    end
  end
end