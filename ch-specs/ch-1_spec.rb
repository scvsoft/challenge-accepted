require 'minitest/autorun'

describe 'CH1' do
  describe '#execute' do
    it 'returns 0 to param 0' do
      CH1.new.execute(0).must_equal 0
    end

    it 'returns 1 to param 1' do
      CH1.new.execute(1).must_equal 1
    end

    it 'returns 1 to param 2' do
      CH1.new.execute(2).must_equal 1
    end

    it 'returns 2 to param 3' do
      CH1.new.execute(3).must_equal 2
    end

    it 'returns 3 to param 4' do
      CH1.new.execute(4).must_equal 3
    end

    it 'returns 5 to param 5' do
      CH1.new.execute(5).must_equal 5
    end

    it 'returns 8 to param 6' do
      CH1.new.execute(6).must_equal 8
    end

    it 'returns 13 to param 7' do
      CH1.new.execute(7).must_equal 13
    end

    it 'returns 21 to param 8' do
      CH1.new.execute(8).must_equal 21
    end

    it 'returns 34 to param 9' do
      CH1.new.execute(9).must_equal 34
    end

    it 'returns 55 to param 10' do
      CH1.new.execute(10).must_equal 55
    end

    it 'returns 89 to param 11' do
      CH1.new.execute(11).must_equal 89
    end

    it 'returns 144 to param 12' do
      CH1.new.execute(12).must_equal 144
    end

    it 'returns 233 to param 13' do
      CH1.new.execute(13).must_equal 233
    end

    it 'returns 377 to param 14' do
      CH1.new.execute(14).must_equal 377
    end

    it 'returns 610 to param 15' do
      CH1.new.execute(15).must_equal 610
    end

    it 'returns 987 to param 16' do
      CH1.new.execute(16).must_equal 987
    end

    it 'returns 1597 to param 17' do
      CH1.new.execute(17).must_equal 1597
    end

    it 'returns 2584 to param 18' do
      CH1.new.execute(18).must_equal 2584
    end

    it 'returns 4181 to param 19' do
      CH1.new.execute(19).must_equal 4181
    end

    it 'returns 6765 to param 20' do
      CH1.new.execute(20).must_equal 6765
    end

    it 'returns 10946 to param 21' do
      CH1.new.execute(21).must_equal 10946
    end

    it 'returns 17711 to param 22' do
      CH1.new.execute(22).must_equal 17711
    end

    it 'returns 28657 to param 23' do
      CH1.new.execute(23).must_equal 28657
    end

    it 'returns 46368 to param 24' do
      CH1.new.execute(24).must_equal 46368
    end

    it 'returns 75025 to param 25' do
      CH1.new.execute(25).must_equal 75025
    end

    it 'returns 121393 to param 26' do
      CH1.new.execute(26).must_equal 121393
    end

    it 'returns 196418 to param 27' do
      CH1.new.execute(27).must_equal 196418
    end

    it 'returns 317811 to param 28' do
      CH1.new.execute(28).must_equal 317811
    end

    it 'returns 514229 to param 29' do
      CH1.new.execute(29).must_equal 514229
    end

    it 'returns 832040 to param 30' do
      CH1.new.execute(30).must_equal 832040
    end
  end
end

$SAFE = 2

