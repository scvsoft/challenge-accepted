def poker_hand(cards)
  straight = /1{5}|1{4}0+1$/ # Escalera
  card_count=[0]*13
  # Count the cards of each rank into card_count and check for all cards of the same suit
  not_same_suit = cards.map do |card|
    card_count['23456789DJQKA'.index card[0]]+=1
    card[1]
  end.uniq[1]

  solution_hash = {}

  if not_same_suit
    # Build hash with regexp for each hand
    solution_hash = Hash[straight,'escalera',?4,'poker',/3.*2|2.*3/,'full',?3,'pierna',/2.*2/,'doble par',?2,'par',0,'carta mas alta']
  else
    # Build hash with regexp for each hand
    solution_hash = Hash[/1{5}$/,'escalera real',straight,'escalera de color',0,'color']
  end
  # apply regexp for solution and return hand string
  solution_hash.find{|r,y|card_count.join[r]}[1]
end

cards = ARGV
puts poker_hand(cards)