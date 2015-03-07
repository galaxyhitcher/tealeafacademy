odd_array = []

[1,2,3,4,5,6,7,8,9,10].select {|i| odd_array << i if i%2 == 1}

puts odd_array.to_s