def speak str
  puts "=> " + str
  puts
end

speak "Please enter integers!"

speak "What is your first number?"

a = gets.chomp

speak "What is your second number?"

b = gets.chomp

a = a.to_i
b = b.to_i

speak "Enter the operation you would like to perform on a and b: +, -, /, *"

op = gets.chomp

if op == "+"
  puts "#{a} + #{b} = #{a+b}"
elsif op == "-"
  puts "#{a} - #{b} = #{a-b}"
elsif op == "/"
  puts "#{a} / #{b} = #{a.to_f/b.to_f}"
elsif op == "*"
  puts "#{a} * #{b} = #{a*b}"
end


exit = "N"

while exit != "Y"
  puts "exit? (Y/N)"
  exit = gets.chomp
end