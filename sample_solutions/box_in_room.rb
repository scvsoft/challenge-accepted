def box_layout(room_size, boxes)
  room_volume = volume(room_size)

  boxes_amount = []

  boxes.each do |box|
    box_volume = volume(box)
    box_quantity = room_volume / box_volume

    if box_quantity == box_quantity.to_i
      boxes_amount << box_quantity.to_i
    else
      boxes_amount << 0
    end
  end

  maximum = boxes_amount.max
  boxes_amount.map { |amount| (maximum == amount) ? amount : 0 }.join(',')
end

def volume(dimensions)
  dimensions.split(',').map(&:to_f).reduce(:*)
end

room_size =  ARGV.shift
boxes = ARGV

puts box_layout(room_size, boxes)
