def poker_hand(cards)
  cards = cards.split(" ")
  f=/1{5}|1{4}0+1$/
  s=[0]*13
  Hash[*cards.map{|c|s['23456789DJQKA'.index c[0]]+=1;c[1]}.uniq[1]?[f,'escalera',?4,'poker',/3.*2|2.*3/,'full',?3,'pierna',/2.*2/,'doble par',?2,'par',0,'carta mas alta']:[/1{5}$/,'escalera real',f,'escalera de color',0,'color']].find{|r,y|s.join[r]}[1]
end

def card
  '23456789DJQKA'[rand(13),1] + 'CRPT'[rand(4),1]
end

500.times do
  cards = ''
  5.times do |index|
    cards << card
    cards << " " unless index == 4
  end

  puts "['#{cards}', '#{poker_hand(cards)}'],"
end