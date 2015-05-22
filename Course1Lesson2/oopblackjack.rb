# TODO: do not allow player to bet more than is in his wallet
require 'pry'
class Player
  attr_accessor :hand, :hit, :cash
  def initialize(cash = false)
    @hand = Hand.new
    @hit = true
    if cash
      @cash = cash
    end
  end

  def bust?
    hand.bust?
  end

  def total
    hand.total
  end

  def blackjack?
    hand.blackjack?
  end
end

class Deck
  attr_accessor :deck
  def initialize
    @deck = []
    ['A','2','3','4','5','6','7','8','9','10','J','Q','K'].each do |rank|
      ['D','C','S','H'].each do |suit|
        @deck << rank + suit
      end
    end
    shuffle
  end

  def start_deal(player1, player2)
    2.times { player1.hand.cards << @deck.pop }
    2.times { player2.hand.cards << @deck.pop }
  end

  def deal(player)
    player.hand.cards << @deck.pop
  end

  def shuffle
    @deck = @deck.shuffle
  end
end

class Hand
  attr_accessor :cards
  def initialize
    @cards = []
  end

  def display
    printout = ""
    @cards.each do |card|
      printout += card + " "
    end
    printout += "for a total of " + total.to_s
    printout
  end

  def how_many_cards
    @cards.count
  end

  def value_of_card(card)
    if ['2','3','4','5','6','7','8','9','10'].include?(card[0..-2])
      card.to_i
    elsif ['J','Q','K'].include?(card[0..-2])
      10
    else
      'Ace'
    end
  end

  def ace_count
    aces = 0
    @cards.each do |card|
      if value_of_card(card) == 'Ace'
        aces += 1
      end
    end
    aces
  end

  def value_of_non_ace_cards
    total = 0
    @cards.each do |card|
      if value_of_card(card) != 'Ace'
        total += value_of_card(card)
      end
    end
    total
  end

  def total
    if ace_count == 0
      value_of_non_ace_cards
    elsif ace_count == 1
      if value_of_non_ace_cards + 11 <= 21
        value_of_non_ace_cards + 11
      else
        value_of_non_ace_cards + 1
      end
    elsif ace_count > 1
      if value_of_non_ace_cards + 11 + ace_count - 1 <= 21
        value_of_non_ace_cards + 11 + ace_count - 1
      else
        value_of_non_ace_cards + ace_count
      end
    end
  end

  def bust?
    total > 21
  end

  def blackjack?
    (how_many_cards == 2) && (total == 21)
  end
end

class Game
  attr_accessor :you, :computer, :deck
  def initialize
    @you = Player.new(get_players_wallet)
    @computer = Player.new
    @deck = Deck.new
  end

  def get_players_wallet
    puts
    puts "How much would you like to play with today?"
    cash = gets.chomp.to_i
  end

  def your_wallet
    @you.cash
  end

  def get_bet
    try_again = true
    while try_again
      puts "How much do you want to bet?"
      bet = gets.chomp.to_i
      puts
      if bet > your_wallet
        puts "That's more than you have in your wallet!  Try again."
        puts
      else
        try_again = false
      end
    end
    bet
  end

  def deal_to_players_hand
    @deck.deal(you)
  end

  def hit?
    input = gets.chomp
    puts
    input.upcase == 'Y' unless you.bust?
  end

  def display_players_hand
    puts "You have: " + @you.hand.display
  end

  def display_computers_hand
    puts "Computer has: " + @computer.hand.display
  end

  def deal_to_computers_hand
    puts @deck.deal(computer)
  end

  def computer_total
    @computer.hand.total
  end

  def ask_player_if_they_want_to_hit
    if !you.bust?
      puts "Hit? (Y/N)"
    else
      puts "You busted, press any key."
      puts
    end
  end

  def player_goes
    display_players_hand
    ask_player_if_they_want_to_hit
    while hit?
      deal_to_players_hand
      display_players_hand
      ask_player_if_they_want_to_hit
    end 
  end

  def computer_goes
    display_computers_hand
    while computer_total < 17
      deal_to_computers_hand
      display_computers_hand
    end
  end

  def deal_cards
    @deck.start_deal(you,computer)
  end

  def blackjack?(player)
    player.hand.blackjack?
  end

  def total(player)
    player.hand.total
  end

  def bust?(player)
    player.hand.bust?
  end

  def analyze_hands
    if you.blackjack? && computer.blackjack?
      puts "Both you and the computer got blackjack, so it's a push."
      "push"
    elsif computer.blackjack?
      puts "Computer got blackjack, so computer wins."
      "computer"
    elsif you.blackjack?
      puts "You got blackjack, you win!"
      "you"
    elsif you.bust? && computer.bust?
      puts "Both you and the computer busted, it looks like the computer wins."
      "computer"
    elsif you.bust?
      puts "You busted, you lose."
      "computer"
    elsif computer.bust?
      puts "Computer busted, you win!"
      "you"
    elsif you.total > computer.total
      puts "You have a higher score, you win!"
      "you"
    elsif computer.total > you.total
      puts "Computer has a higher score, computer wins!"
      "computer"
    elsif computer.total == you.total
      puts "You and the computer have the same score, it's a push."
      "push"
    end
  end

  def ask_player_if_they_want_to_continue
    puts "Do you want to continue? (Y/N)"
    input = gets.chomp.upcase
    input == 'Y'
  end

  def if_player_won_add_to_players_wallet(bet,winner)
    if winner == "you"
      @you.cash += 2*bet
    elsif winner == "push"
      @you.cash += bet
    end
  end

  def decrement_players_wallet_by(bet)
    @you.cash -= bet
  end

  def show_players_wallet
    puts
    puts "You have: " + your_wallet.to_s + " dollars."
    puts
  end

  def shuffle_deck
    @you.hand = Hand.new
    @computer.hand = Hand.new
    @deck = Deck.new
  end

  def initial_betting
    show_players_wallet
    bet = get_bet
    decrement_players_wallet_by(bet)
    bet
  end

  def play
    another_round = true
    while another_round
      shuffle_deck
      deal_cards
      bet = initial_betting
      player_goes
      computer_goes
      winner = analyze_hands
      if_player_won_add_to_players_wallet(bet,winner)
      another_round = ask_player_if_they_want_to_continue
    end
    show_players_wallet
  end
end

battle = Game.new

battle.play




