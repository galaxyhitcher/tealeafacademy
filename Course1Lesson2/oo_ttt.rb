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
	
	def combo(a,b,c)
	    a, b, c = a.to_i, b.to_i, c.to_i
	    if @state[a] == @state[b] && @state[b] == @state[c] && @state[a] != ' '
	        return true
	    else
	        return false
	    end
	end
	
	def win?
	    if combo(0,1,2) || combo(3,4,5) || combo(6,7,8) || combo(0,3,6) || combo(1,4,7) || combo(2,5,8) || combo(0,4,8) || combo(2,4,6)
	        return true
	    else
	        return false
	    end
	end
	
	def tied?
	    if !win?
	        #check to see if board is filled
	        @state.each do |pos|
	            if pos == ' '
	                return false
	            end
	        end
	        return true
	    end
	end
end

class Game
	attr_accessor :completed
	def initialize
		@completed = false
		@gameboard = Board.new
	end

	def play
		human = Player.new
		comp = Computer.new
		winner = "Computer"
		
		#until the game is won or tied, player takes a turn, then computer takes a turn

		#print the board
		#ask the player where he wants to move
		#if the space is occupied, tell the user to pick another space

		#computer picks an unoccupied space

		until @gameboard.win? || @gameboard.tied?
			occupied = true
			while occupied == true
				@gameboard.print
				puts "where do you want to move?"
				pos = gets.chomp.to_i
				if @gameboard.state[pos] == ' '
					@gameboard.state[pos] = human.symbol
					occupied = false
				else
					puts "this spot is occupied, pick another"
				end
			end

			if @gameboard.win? || @gameboard.tied?
				winner = "You"
				break
			end

			

			unoccupied = []
			(0..8).each do |i|
				if @gameboard.state[i] == ' '
					unoccupied << i
				end
			end

			@gameboard.state[unoccupied.sample] = comp.symbol

		end

		@gameboard.print
		puts winner + " Won!"
	end

end
	

battle = Game.new

battle.play
