def anagram(words)
  word_hash = {}
  words.each do |word|
    sorted_word = word.downcase.chars.sort.join.strip
    word_hash[sorted_word] = word_hash[sorted_word] + 1 rescue 1
  end

  total = 0
  word_hash.each do |_, value|
    total += combination(value, 2) if !!value && value > 1
  end

  total
end

def combination(n,k)
  return 0 if n < 0 or k < 0 or n < k
  factorial(n) / (factorial(k) * factorial(n - k))
end

def factorial(n)
  return 0 if n.nil?
  return 1 if n == 0
  n.downto(1).inject(:*)
end

words = File.open('/usr/share/dict/words').read
  .scan(/^[a-zA-Z]{6}$/i)

lists = words.group_by { |element| element.downcase.chars.sort }.values

lists = lists.reject {|item| item.length < 2 }.sample(900).map do |list|
  if list.length > 7
    list[0,7]
  else
    list + words.sample(7 - list.length)
  end

end

lists.each {|list| puts "[#{list.inspect}, '#{anagram(list)}'],"}