  # draw a board

  #   assign player to "X"
  #   assign computer to "O"
  # loop until all squares are taken or a winner
  #   player  picks an empty square
  #   computer picks an empty square

  # if there is a winner 
  #   show the winner
  # or else
  #   it's a tie

def initialize_board
  b = Hash.new
  (1..9).each {|i| b[i] = ' '}
  b
end

def print_board b
  system 'clear'
  puts " #{b[1]} | #{b[2]} | #{b[3]} "
  puts '-----------'
  puts " #{b[4]} | #{b[5]} | #{b[6]} "
  puts '-----------'
  puts " #{b[7]} | #{b[8]} | #{b[9]} "

end

def open_squares b
  b.select {|k,v| v == ' '}.keys
end

board = initialize_board

def winning_message b
  winning_lines = [[1,4,7],[2,5,8],[3,6,9],[1,2,3],[4,5,6],[7,8,9],[1,5,9],[3,5,7]]

  winning_lines.each do |line|
    if b[line[0]] == 'X' and b[line[1]] == 'X' and b[line[2]] == "X"
      return "Player wins!"
    elsif b[line[0]] == 'O' and b[line[1]] == 'O' and b[line[2]] == 'O'
      return "Computer wins!"
    end
    
      
  end
  nil
end

def empty_positions b
  b.select {|k,v| v == ' '}.keys
end

def computer_choice b
  b[empty_positions(b).sample] = 'O'
end

begin
  
  puts "Choose a position (from 1 to 9) to choose a piece"
  print_board(board)
  choice = gets.chomp.to_i
  if board[choice] != ' '
    puts "Please pick an empty position"
    next
  end
  board[choice] = 'X'

  
  if not winning_message(board)
    computer_choice(board)
  end

end until winning_message(board) || open_squares(board).empty?

print_board board
if winning_message board
  puts winning_message(board)
else
  puts "It's a tie."
end

