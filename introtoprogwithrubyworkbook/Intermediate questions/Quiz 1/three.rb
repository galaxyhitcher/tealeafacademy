# three.rb

# puts "the value of 40 + 2 is " + (40 + 2)

# this returns the error "can't convert Fixnum into String (TypeError)"

# one way this can be fixed:

puts "the value of 40 + 2 is " + (40 + 2).to_s

# second way this can be fixed

puts "the value of 40 + 2 is " + "#{40+2}"

