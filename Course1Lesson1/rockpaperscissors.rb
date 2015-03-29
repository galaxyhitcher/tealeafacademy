finished = "N"

while finished == "N"
  user_choice = String.new
   while user_choice.upcase != "P" and user_choice.upcase != "R" and user_choice != "S"
    puts "Play Paper Rock Scissors!"
    puts "Choose one: (P/R/S)"

    user_choice = gets.chomp.upcase

  end

  computer_choice = ["P","R","S"].sample


  if user_choice == "P"
    if computer_choice == "P"
      puts "You picked Paper and computer picked Paper."
      puts "It's a tie."
    elsif computer_choice == "R"
      puts "You picked Paper and computer picked Rock."
      puts "Paper wraps Rock!"
      puts "You won!"
    elsif computer_choice == "S"
      puts "You picked Paper and computer picked Scissors."
      puts "Scissors cut Paper!"
      puts "Computer won!"
    end
  elsif user_choice == "R"
    if computer_choice == "P"
      puts "You picked Rock and computer picked Paper."
      puts "Paper wraps Rock!"
      puts "Computer won!"
    elsif computer_choice == "R"
      puts "You picked Rock and computer picked Rock."
      puts "It's a tie."
    elsif computer_choice == "S"
      puts "You picked Rock and computer picked Scissors."
      puts "Rock smashes Scissors!"
      puts "You won!"
    end
  elsif user_choice == "S"
    if computer_choice == "P"
      puts "You picked Scissors and computer picked Paper."
      puts "Scissors cut Paper."
      puts "You won!"
    elsif computer_choice == "R"
      puts "You picked Scissors and computer picked Rock."
      puts "Rock smashes Scissors!"
      puts "Computer won!"
    elsif computer_choice == "S"
      puts "You picked Scissors and computer picked Scissors."
      puts "It's a tie."
    end
  end
  puts "Are you finished, or do you want to play again? (Y/N)?"
  finished = gets.chomp.upcase
end


#Paper wraps Rock!
#You won!

#You picked Scissors and the computer picked Scissors
#It's a tie.

#Play again? (Y/N)