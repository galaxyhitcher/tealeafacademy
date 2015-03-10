def add1(num)
  
  num + 4

end


num = 2

how_deep = "num"

10.times{ how_deep.gsub!("num", "add1(num)")}

puts eval(how_deep)

# so, 42 is returned