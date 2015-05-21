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

  def display_string
    printout = ""
    @cards.each do |card|
      printout += card + " "
    end
    printout += "for a total of " + total.to_s
    printout
  end

  def display_masked_string
    "This is the dealer's hand: ?? " + @cards[1]
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
  attr_accessor :you, :computer, :deck, :you_win
  def initialize
    @you = Player.new(get_wallet)
    @computer = Player.new
    @deck = Deck.new
    @you_win = false
  end

  def get_wallet
    puts
    puts "How much do you want in your wallet today?"
    input = gets.chomp.to_i
    puts
    input
  end

  def get_choice
    puts "Do you want to hit? (Y/N)?"
    puts
    choice = gets.chomp
    puts
    choice.capitalize == "Y"
  end

  def check_if_you_are_busted
    if you.hand.bust?
      puts you.hand.display_string
      puts "You busted!  Computer won."
    end
  end

  def show_hands
    puts "Dealer has:"
    computer.hand.display
    puts "You have:"
    you.hand.display
  end

  def player_goes
    input = true
    while input && !you.hand.bust?
      puts "You have: " + you.hand.display_string
      if you.hand.how_many_cards == 2
        puts "Computer has: " + computer.hand.display_masked_string
      else
        puts "Computer has: " + computer.hand.display_string
      end
      input = get_choice
      if input
        @deck.deal(you)
      end
    end
  end

  def check_for_endgame_conditions
    you.hand.bust?
  end
  def computer_goes
    while (computer.hand.total < you.hand.total) && (computer.hand.total < 17)
      @deck.deal(computer)
    end
  end

  def nobody_busted?
    !(you.hand.bust? || computer.hand.bust?)
  end


  def analyze_hands
    puts "You have: " + you.hand.display_string
    puts "Computer has: " + computer.hand.display_string
    if anyone_has_blackjack?
      print_blackjack_message
    elsif you.hand.total == computer.hand.total && nobody_busted?
      puts "Both players got the same score, computer wins."
    elsif you.hand.total > computer.hand.total && nobody_busted?
      puts "You got the higher score, you won!"
      @you_win = true
    elsif computer.hand.total > you.hand.total && nobody_busted?
      puts "The Computer got the higher score, Computer wins."
    elsif computer.hand.bust?
      puts "You didn't bust, you won!"
      @you_win = true
    elsif you.hand.bust?
      puts "You busted, computer won."
    end
    puts
  end

  def print_blackjack_message
    if you.hand.blackjack? && computer.hand.blackjack?
      puts "Computer won, but you both had blackjacks."
    elsif computer.hand.blackjack?
      puts "Computer has blackjack, computer wins."
    elsif you.hand.blackjack?
      puts "You have blackjack!  You win!"
      @you_win = true
    end
  end

  def anyone_has_blackjack?
    you.hand.blackjack? || computer.hand.blackjack?
  end

  def check_for_blackjacks
    print_blackjack_message
  end

  def increment_wallet(bet)
    if you_win
      you.cash += 2*bet
    end
    puts "You have: " + you.cash.to_s + " dollars."
    puts
  end

  def start_deal
    deck.start_deal(you,computer)
  end

  def start_round
    puts
    start_deal
    @you_win = false
    game_ended = false
  end

  def get_bet
    puts "How much do you want to bet on this round?"
    bet = gets.chomp.to_i
  end

  def decrement_wallet(bet)
    you.cash -= bet
  end

  def continue?
    puts "Do you want to keep playing? (Y/N)"
    input = gets.chomp
    puts
    input.upcase == 'Y'
  end
  def refresh_hands_and_deck
    you.hand = Hand.new
    computer.hand = Hand.new
    self.deck = Deck.new
  end

  def betting
    bet = get_bet
    if bet > you.cash
      puts "That cash bet is more then you have in your wallet!"
      puts
      bet = 0
    end
    if !(bet > you.cash)
      decrement_wallet(bet)
    end
    
    bet
  end

  def player_goes_and_computer_goes(is_the_game_ended)
    player_goes unless is_the_game_ended 
    game_ended = check_for_endgame_conditions
    computer_goes unless is_the_game_ended 
  end
    

  def play
    keep_playing = true

    while keep_playing
      bet = betting
      if bet > 0
        game_ended = false
        refresh_hands_and_deck
        
        start_round
        game_ended = anyone_has_blackjack?
        player_goes_and_computer_goes(game_ended)
      
        analyze_hands 
        increment_wallet(bet)
      end 
      keep_playing = continue?
    end
    
  end
  
end

battle = Game.new

battle.play




