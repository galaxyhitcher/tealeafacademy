str = "and seven years ago..."

# first way

str = "Four score " + str

puts str

# second way

str = "and seven years ago..."

str = str.prepend("Four score ")

puts str