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
    if @gameboard.state[a] == @gameboard.state[b] && @gameboard.state[b] == @gameboard.state[c] && @gameboard.state[a] != ' '
      true
    else
      false
    end
  end

  def win?
    if combo(0,1,2) || combo(3,4,5) || combo(6,7,8) || combo(0,3,6) || combo(1,4,7) || combo(2,5,8) || combo(0,4,8) || combo(2,4,6)
      true
    else
      false
    end
  end



  def tied?
    if !win?
      @gameboard.state.each do |pos|
        if pos == ' '
          return false
        end
      end
      true
    end
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

  def set_winner_if_game_ended(winner)
    if self.win?
      self.winner = winner
      return true
    end
    false
  end

  def play
    self.gameboard.print
    until self.win? || self.tied? || self.input.to_s.upcase == 'Q'
      self.get_player_input

      while !self.gameboard.available_moves.include?(self.input - 1)
        puts "That space is invalid or already taken."
        self.gameboard.print
        self.input = gets.chomp.to_i
      end

      self.human.mark_board(self.gameboard, self.input - 1)

      if self.set_winner_if_game_ended("human")
        break
      end

      unless self.gameboard.available_moves.sample == nil
        comp.mark_board(self.gameboard, self.gameboard.available_moves.sample)
      end

      self.set_winner_if_game_ended("computer")

      self.gameboard.print
    end

    self.print_endgame_info
  end
end

battle = Game.new

battle.play
	




