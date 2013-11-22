room_size =  ARGV.shift
boxes = ARGV

room_volume = room_size.split(',').map(&:to_f).reduce(:*)

boxes_amount = []

# Dumy way
boxes.each do |box|
  box_volume = box.split(',').map(&:to_f).reduce(:*)
  box_quantity = room_volume / box_volume
  if box_quantity == box_quantity.to_i
    # No queda espacio libre
    boxes_amount << box_quantity.to_i
  else
    boxes_amount << 0
  end
end

# Find the maximum, set the rest to 0
maximum = boxes_amount.max
puts boxes_amount.map { |amount| (maximum == amount) ? amount : 0 }.join(',')
