class Competitor
  attr_accessor :symbol
  def initialize(symbol)
    @symbol = symbol
  end

  def mark_board(board,pos)
    board.mark(pos,@symbol)
  end
end

class Player < Competitor
  attr_accessor :symbol
  def initialize
    @symbol = 'x'
  end
end

class Computer < Competitor
  attr_accessor :symbol
  def initialize
    @symbol = 'o'
  end
end

class Board
  attr_accessor :state

  def initialize
    @state = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
  end

  def print
    puts @state[0] +'|'+ @state[1] +'|' + @state[2] 
    puts '_____'
    puts @state[3] +'|'+ @state[4] +'|' + @state[5] 
    puts '_____'
    puts @state[6] +'|'+ @state[7] +'|' + @state[8] 
  end

  def mark(pos,marker)
    @state[pos] = marker
  end

  def available_moves

    available_moves = []

    (0..8).each do |i|
      if self.state[i] == ' '
        available_moves << i
      end
    end

    available_moves

  end
end

class Game
  attr_accessor :gameboard, :winner, :input, :human, :comp

  def initialize
    @gameboard = Board.new
    @winner = false
    @input = false
    @human = Player.new
    @comp = Computer.new
  end

  def combo(a,b,c)
    a, b, c = a.to_i, b.to_i, c.to_i
    @gameboard.state[a] == @gameboard.state[b] && @gameboard.state[b] == @gameboard.state[c] && @gameboard.state[a] != ' '
  end

  def win?
    combo(0,1,2) || combo(3,4,5) || combo(6,7,8) || combo(0,3,6) || combo(1,4,7) || combo(2,5,8) || combo(0,4,8) || combo(2,4,6)
  end

  def board_full?
    !self.gameboard.state.include?(' ')
  end

  def tied?
    board_full? && !win?
  end

  def print_endgame_info
    system "clear"
    self.gameboard.print
    if self.win?
      puts self.winner.capitalize + " won!"
    else
      puts "Cat's Game"
    end
  end

  def get_player_input
    puts "Where do you want to move?"
    self.input = gets.chomp.to_i

    system "clear"
  end

  

  def game_ended?
    self.win? || self.tied?
  end

  def valid_move?
    self.gameboard.available_moves.include?(self.input - 1)
  end

  def game_over_point?
    self.game_ended?
  end

  def check_for_winner(winner)
    if self.win?
      self.winner = winner
    end
  end

  def print_gameboard
    self.gameboard.print
  end

  def player_marks_board
    self.get_player_input
    while !valid_move? && !self.tied?
      puts "That space is invalid or already taken."
      self.gameboard.print
      self.input = gets.chomp.to_i
    end
    self.human.mark_board(self.gameboard, self.input - 1)
  end

  def computer_marks_board
    comp.mark_board(self.gameboard, self.gameboard.available_moves.sample)
  end

  def player_turn
    player_marks_board
    check_for_winner("human")
  end

  def computer_turn
    computer_marks_board
    check_for_winner("computer")
  end

  def play
    print_gameboard
    until game_ended?
      player_turn
      break if game_over_point?    
      computer_turn
      print_gameboard
    end
    print_endgame_info
  end
end

battle = Game.new

battle.play
	




