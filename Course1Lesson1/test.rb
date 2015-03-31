# player places bet 

# dealer must take cards until his total is 17

# a tie is called a push, neither player wins or loses

# a player blackjack (or natural 21) beats any dealer hand except blackjack, if both player and dealer have blackjack, it's a push

# player is dealt two cards

# dealer is dealt one face up and one face down card

# player can hit or stand

# if player can hit until he busts, then dealer plays until he at hits 17, if player has higher than 17, 
# then dealer must hit until he beats player

# if player wins, his bet is doubled and his money is returned to his wallet

ranks = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
suits = ["H","D","C","S"]

def initialize_deck
  deck = Array.new
  ranks = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
  suits = ["H","D","C","S"]
  ranks.each do |rank|
    suits.each do |suit|
      deck << rank + suit
    end
  end
  deck
end

def get_card_from_deck deck
  pick = deck.sample
  deck.delete_at(deck.find_index(pick))
  pick
end

def deal_to_hand(hand,deck)
  hand << get_card_from_deck(deck)
end

def display_wallet wallet
  puts "You currently have " + wallet.to_s + " dollars."
end

def display_hand hand
  str = ""
  hand.each do |card|
    str += card + " "
  end
  puts str
end

def display_dealer_hand hand
  puts hand[0] + " ??"
end

def value_of_card card
  rank = card[0..-2]
  if rank.to_i == 0
    if rank == "A"
      return "ace"
    else
      return 10
    end
  else
    return rank.to_i
  end
end

def hand_contains_ace? hand
  hand.each do |card|
    return true if card[0] == "A"
  end
  false
end

def count_aces hand
  count = 0
  hand.each do |card|
    if card[0] == "A"
      count += 1
    end
  end
  count
end

def busted? hand
  if value_of_hand(hand) <= 21
    return false
  else
    return true
  end
end

def value_of_part_of_hand_without_aces hand
  without_aces = Array.new
  hand.each do |card|
    if card[0] != "A"
      without_aces << card
    end
  end
  value = 0
  without_aces.each do |card|
    value += value_of_card(card)
  end
  value
end

def value_of_hand hand
  if !hand_contains_ace?(hand)
    value = 0
    hand.each do |card|
      value += value_of_card(card)
    end
    return value
  else
    value = count_aces(hand) -1 + 11 + value_of_part_of_hand_without_aces(hand)
    if value > 21
      return count_aces(hand) + value_of_part_of_hand_without_aces(hand)
    end
    return value
  end
end
puts value_of_part_of_hand_without_aces(["AH","10H"])