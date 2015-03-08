# answer to Problem 2

puts "How old are you?"
age = gets.chomp.to_i
age_array = [10,20,30,40]

age_array.each do |years|

  puts "In " + years.to_s + " years you will be:"
  puts age + years

end

