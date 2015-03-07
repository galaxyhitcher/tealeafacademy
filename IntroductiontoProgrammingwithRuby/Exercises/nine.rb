# nine.rb

h = { a:1, b:2, c:3, d:4 }

# Get the value of the key ':b'.

puts h[:b]

# Add to this hash the key:value pair '{e:5}'

h.merge!({e:5})

puts h.to_s

# Remove all key:value pairs whose value is less than 3.5

h.delete_if {|key,value| value < 3.5}

puts h