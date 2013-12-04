def box_layout(room_size, boxes)
  room_volume = volume(room_size)

  box_volumes = boxes.map {|box| volume(box)}

  result = choose_boxes(room_volume, box_volumes)
  box_count = Hash.new(0)
  result.each do |box_volume|
    box_count[box_volume] += 1
  end
  (box_count.empty?) ? 0 : box_volumes
    .map {|box_volume| box_count[box_volume] }
    .join(",")
end

# http://rubyquiz.com/quiz154.html
def choose_boxes(room_volume, box_volumes)
  sorted_volumes = box_volumes.sort { |a,b| b <=> a }

 # memoize solutions
 solutions = Hash.new do |hash, key|
   hash[key] = if key < sorted_volumes.min
     []
   else
     # prune boxes that don't fit
     sorted_volumes.reject { |box| box > key }.
       # recurse
       map { |box| [box] + hash[key - box] }.
       # prune unhelpful solutions
       reject { |volume| volume.reduce(:+) != key }.
       # pick the one that uses most boxes, empty if none
       max { |a, b| a.size <=> b.size } || []
   end
 end

 solutions[room_volume]
end

def volume(dimensions)
  dimensions.split(',').map(&:to_f).reduce(:*)
end

room_size =  ARGV.shift
boxes = ARGV

puts box_layout(room_size, boxes)
# Another probably faster alternative is the mathematical solution:
# Check if there is any linear combination of box volumes that fills the room
# room_volume % gcd(box_volumes) != 0
# otherwise result is zero.
# Get possible positive integer linear combinations to complete volume
# Check which of possible linear combinations, if any, allows to fit boxes
# in room constraints.