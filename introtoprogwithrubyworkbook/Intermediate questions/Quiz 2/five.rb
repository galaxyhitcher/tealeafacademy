# five.rb

str = "Humpty Dumpty sat on a wall."

str = str.split(/\W/).reverse.join(" ") + "."

puts str

