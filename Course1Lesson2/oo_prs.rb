# 1. Both players pick a hand of either "paper", "rock", or "scissors"
# 2. Then, the two hands are compared and it's either a tie if the hands are the same, or p>r, r>s, s>p.
require 'pry'

CHOICES = {'p'=>'Paper','r'=>'Rock','s'=>'Scissors'}

class Hand
  include Comparable
  attr_accessor :choice
  
  def initialize
    @choice = ''
  end

  

  def get_choice
    while !CHOICES.keys.include?(@choice.downcase)
      puts "Choose one: (P/R/S)"
      @choice = gets.chomp
    end
  end
end

class Player
  attr_accessor :hand
  def initialize
    @hand = Hand.new
    hand.choice
  end
end

class Computer < Player
  attr_reader :hand
  def pick_hand
    @hand = Hand.new
    hand.choice = CHOICES.keys.sample
  end
end

class Human < Player
  attr_reader :hand
  def initialize
    @hand = Hand.new
  end
  def pick_hand
    @hand.get_choice
  end
end

class Game
  include Comparable

  def <=>(p1,p2)
    if p1 == p2
      0
    elsif (p1 == 'p' && p2 == 'r') || (p1 == 'r' && p2 == 's') || (p1 == 's' && p2 == 'p')
      1
    else
      -1
    end
  end

  def display_winning_message(winner,pick)
    if pick == 'p'
      puts "Paper wraps Rock!"
      puts "#{winner} won!"
    elsif pick == 'r'
      puts "Rock smashes Scissors!"
      puts "#{winner} won!"
    else
      puts "Scissors cuts Paper!"
      puts "#{winner} won!"
    end
  end

  def play
    puts "Welcome to Paper Rock Scissors!"
    human = Human.new
    human.pick_hand
    computer = Computer.new
    computer.pick_hand
    human_choice = human.hand.choice
    computer_choice = computer.hand.choice
    puts "You picked #{CHOICES[human_choice]} and computer picked #{CHOICES[computer_choice]}."

    if (computer_choice<=>human_choice) == 1
      display_winning_message("You",human_choice)
    elsif (computer_choice<=>human_choice) == -1
      display_winning_message("Computer",computer_choice)
    else
      puts "It's a tie."
    end
    
  end
end

pinky = Hand.new

game = Game.new
game.play