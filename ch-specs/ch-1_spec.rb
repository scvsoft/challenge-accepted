require 'minitest/autorun'

describe 'Algo' do
  describe '#execute' do
    it 'works' do
      CH1.new.execute.must_equal true
    end
  end
end

$SAFE = 2