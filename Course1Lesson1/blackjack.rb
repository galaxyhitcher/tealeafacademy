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
  str
end

def display_dealer_hand hand
  puts "Dealer has: " + hand[0] + " ??"
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

def show_hand(player,hand)
  puts player.capitalize + " has: " + display_hand(hand)
end

# add 5 decks together and shuffle
def make_five_shuffled_decks
  deck = Array.new 
  5.times do |i|
    deck = deck + initialize_deck
  end

  deck.shuffle!
end

deck = make_five_shuffled_decks

puts

puts "Welcome to Blackjack!"

puts

puts "What is your name?"

puts

player_name = gets.chomp

puts

puts "How many chips would you like to buy?"

puts

player_wallet = gets.chomp.to_i

puts

display_wallet(player_wallet)

puts

keep_playing = ""

while keep_playing != "N" && !deck.empty?

  puts "How much would you like to bet?"

  puts

  bet = gets.chomp.to_i

  puts

  player_wallet -= bet

  display_wallet(player_wallet)

  puts

  winner = ""

  # combines 5 decks together and then shuffles them


  dealer_hand = Array.new

  player_hand = Array.new

  2.times do
    deal_to_hand(player_hand, deck)
    deal_to_hand(dealer_hand, deck)
  end

  if value_of_hand(player_hand) == 21
    player_blackjack = true
  end

  if value_of_hand(dealer_hand) == 21
    dealer_blackjack = true
  end

  display_dealer_hand dealer_hand
  show_hand(player_name, player_hand)

  puts 

  choice = ""

  while choice.capitalize != "Stand" && !busted?(player_hand) && !player_blackjack && !dealer_blackjack

    puts "Hit or stand?"
    puts
    choice = gets.chomp
    puts
    if choice.capitalize == "Hit"
      show_hand("dealer", dealer_hand)
      puts
      deal_to_hand(player_hand, deck)
    end
    show_hand(player_name, player_hand)
    puts 
    puts "Busted!" if busted?(player_hand)
    winner = "dealer" if busted?(player_hand)
  end

  while !busted?(dealer_hand) && value_of_hand(dealer_hand) < value_of_hand(player_hand) && !dealer_blackjack && !player_blackjack
    if busted?(player_hand)
      break
    end
    deal_to_hand(dealer_hand,deck)
    show_hand("dealer",dealer_hand)
    puts
    if busted?(dealer_hand)
      puts "Dealer busted!"
      puts
      winner = "player"
    end
  end

  if !busted?(dealer_hand) && !dealer_blackjack && !player_blackjack
    show_hand("dealer",dealer_hand)
    puts "Dealer won!"
    winner = "dealer"
  end

  if player_blackjack && !dealer_blackjack
    winner = "player"
    puts "Player blackjack!"
  elsif dealer_blackjack
    winner = "dealer"
    show_hand("dealer",dealer_hand)
    puts
    puts "Dealer blackjack!"
    puts
  elsif player_blackjack && dealer_blackjack
    winner = 'dealer'
    show_hand("dealer",dealer_hand)
    puts "Both " + player_name + " and dealer have blackjack, but the dealer wins..."
    puts
  end
    

  if winner == "player"
    player_wallet += 2*bet
  end
  puts
  display_wallet(player_wallet)
  puts

  if deck.empty?
    puts "The shoe is out of cards, reshuffling..."
    deck = make_five_shuffled_decks
  end

  puts "Keep playing? (Y/N)"
  puts
  keep_playing = gets.chomp.upcase
  puts

end
