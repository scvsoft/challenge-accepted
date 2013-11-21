def transpose(words)
  result = []
  longest_size = words.max_by {|item| item.size}.size

  (0...longest_size).each do |i|
    line = ""
    words.each {|word| line << if word[i].nil? then " " else word[i] end }
    result << line
  end
  result
end

puts transpose(ARGV)