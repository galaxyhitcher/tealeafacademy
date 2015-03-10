# four.rb

str = "The Munsters are creepy in a good way."

puts str[0..3] + str[4].downcase + str[5..-1]

puts str[0].downcase + str[1..3].upcase + str[4].downcase + str[5..-1].upcase

puts str.downcase

puts str.upcase