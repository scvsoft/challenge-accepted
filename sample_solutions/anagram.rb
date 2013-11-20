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

puts anagram(ARGV)
