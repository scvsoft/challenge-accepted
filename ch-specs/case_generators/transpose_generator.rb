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

words = File.open('/usr/share/dict/words').read.scan(/^[a-zA-Z]{1,7}$/i)

500.times do
  list = words.sample(4)
  puts "[#{list.inspect}, \"#{transpose(list).join('\n').rstrip}\"],"
end