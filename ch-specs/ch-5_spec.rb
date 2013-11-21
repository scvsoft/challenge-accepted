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
    # Executor removes trailing whitespace, so no spaces at the end of expected results.
    # Also, sending an empty string so that it will be interpreted by the console.
    [["I", "have", '""', "to", "say"], "Ih ts\n a oa\n v  y\n e" ],
    [['One', 'ring', 'to', 'rule', 'them', 'all'], "Ortrta\nniouhl\nen lel\n g em"],
    [['Lost', 'a', 'planet', 'Obi-Wan', 'has'],
      "LapOh\no lba\ns ais\nt n- \n  eW \n  ta \n   n" ]
  ]

  CASES.each do |args, result|
    it "returns #{result} to param #{args}" do
      @executor.execute(*args).must_equal result
    end
  end
end