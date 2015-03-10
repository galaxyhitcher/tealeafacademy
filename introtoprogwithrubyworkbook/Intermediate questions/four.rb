# four.rb

ary = [1,2,3,4]

ary.each do |item|

  p item

  ary.shift(1)

end

# the following is outputted by this code:

# 1
# 3

ary = [1,2,3,4]

ary.each do |item|

  

  p item

  

  ary.pop(1)

  

end

# this outputs

# 1

# 2