def max_values_for(points)
  max_values = []
  current_max = points.first
  points.each do |point|
    max_values << current_max
    current_max = [point, current_max].max
  end
  max_values
end

def waterfall(ground_level)

  ground_level = ground_level.map { |point| point.to_i }

  left_max = max_values_for ground_level
  right_max = max_values_for ground_level.reverse
  right_max.reverse!

  water_level = left_max.zip(right_max).map { |maximums| maximums.min }
  level = water_level.zip(ground_level).map {|values| [values.reduce(:-),0].max}
  level.reduce(:+)
end

500.times do
  rand = Random.new
  list = (0..9).map { |index| rand.rand(1..9)}
  puts "[#{list.inspect}, '#{waterfall(list)}'],"
end