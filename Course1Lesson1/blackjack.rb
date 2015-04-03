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

require 'pry'

RANKS = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
SUITS = ["H","D","C","S"]
BLACKJACK = 21

def initialize_deck
  deck = []
  RANKS.each do |rank|
    SUITS.each do |suit|
      deck << rank + suit
    end
  end
  deck
end

def say(phrase)
  puts 
  puts phrase
  puts
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
  "You currently have " + wallet.to_s + " dollars."
end

def display_hand hand
  str = ""
  hand.each do |card|
    str += card + " "
  end
  str
end

def display_dealer_hand hand
  "Dealer has: " + hand[0] + " ??"
end

def value_of_card card
  rank = card[0..-2]
  if rank.to_i == 0
    if rank == "A"
      return nil
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
  if value_of_hand(hand) <= BLACKJACK
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

def show_hand(player,hand)
  player.capitalize + " has: " + display_hand(hand)
end

# add 5 decks together and shuffle
def make_five_shuffled_decks
  deck = Array.new 
  5.times do |i|
    deck = deck + initialize_deck
  end

  deck.shuffle!
end

def get_bet(wallet)
  puts

  bet = gets.chomp.to_i

  puts

  while bet > wallet
    say "Not enough money in your wallet, how much do you want to bet?"

    bet = gets.chomp.to_i
  end

  bet
end


deck = make_five_shuffled_decks

puts

say "Welcome to Blackjack!"

say "What is your name?"

puts

player_name = gets.chomp

puts

say "How many chips would you like to buy?"

puts

player_wallet = gets.chomp.to_i

puts

keep_playing = ""

while keep_playing != "N" && !deck.empty?

  say display_wallet player_wallet

  say "How much would you like to bet?"

  bet = get_bet(player_wallet)

  player_wallet -= bet

  winner = ""

  # combines 5 decks together and then shuffles them


  dealer_hand = []

  player_hand = []

  2.times do
    deal_to_hand(player_hand, deck)
    deal_to_hand(dealer_hand, deck)
  end

  if value_of_hand(player_hand) == BLACKJACK
    player_blackjack = true
  end

  if value_of_hand(dealer_hand) == BLACKJACK
    dealer_blackjack = true
  end

  say display_dealer_hand dealer_hand
  say show_hand(player_name, player_hand) 

  choice = ""

  while choice.capitalize != "Stand" && !busted?(player_hand) && !player_blackjack && !dealer_blackjack

    say "Hit or stand?"

    puts
   
    choice = gets.chomp

    puts
    
    if choice.capitalize == "Hit"
      say show_hand("dealer", dealer_hand)
      
      deal_to_hand(player_hand, deck)
    end
    say show_hand(player_name, player_hand)
    
    say "Busted!" if busted?(player_hand)
    winner = "dealer" if busted?(player_hand)
  end

  while !busted?(dealer_hand) && value_of_hand(dealer_hand) < value_of_hand(player_hand) && !dealer_blackjack && !player_blackjack
    if busted?(player_hand)
      break
    end
    deal_to_hand(dealer_hand,deck)
    say show_hand("dealer",dealer_hand)
    if busted?(dealer_hand)
      say "Dealer busted!"
      say display_wallet player_wallet
      winner = "player"
    end
  end

  if !busted?(dealer_hand) && !dealer_blackjack && !player_blackjack
    say show_hand("dealer",dealer_hand)
    say "Dealer won!"
    say display_wallet player_wallet
    winner = "dealer"
  end

  if player_blackjack && !dealer_blackjack
    winner = "player"
    say player_name + " blackjack!"
    say display_wallet player_wallet
  elsif dealer_blackjack
    winner = "dealer"
    say show_hand("dealer",dealer_hand)
    say "Dealer Blackjack!"
    say player_name + "loses..."
    say display_wallet player_wallet
  elsif player_blackjack && dealer_blackjack
    winner = 'dealer'
    say show_hand("dealer",dealer_hand)
    say "Both " + player_name + " and dealer have blackjack, but the dealer wins..."
    say display_wallet player_wallet
  end
    

  if winner == "player"
    player_wallet += 2*bet
  end
  
  display_wallet(player_wallet)
  

  if deck.empty?
    say "The shoe is out of cards, reshuffling..."
    deck = make_five_shuffled_decks
  end

  say "Keep playing? (Y/N)"

  puts
  
  keep_playing = gets.chomp.upcase
  2.times {puts}

end
