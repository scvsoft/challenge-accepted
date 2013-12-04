def to_roman(number)
  result = ''
  roman = %w{M D C L X V I}
  values = [1000, 500, 100, 50, 10, 5, 1]
  values.each_with_index { |value, index|
    c = (number - (number % value))/value
    if c < 4 && c > 0
      c.times { result << roman[index] }
      number -= (c * value)
    end
    s = (index % 2 == 0) ? index+2 : index+1
    if (s < 7) && (number >= (values[index] - values[s]))
        result << roman[s] << roman[index]
        number -= (values[index] - values[s])
    end
  }
  result
end

rand = Random.new
500.times do
  number = rand.rand(1..10000)
  puts "[#{number},'#{to_roman(number)}'],"
end