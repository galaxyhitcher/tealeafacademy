# five.rb

# Hash#select can be used to see if a Hash contains a specific value

def has_value?(ahash, avalue)

  if ahash.select { |k,v| v == avalue }

    true

  else

    false

  end

end

hash1 = { a: 1, b: 2, c: 3 }

puts hash1.has_value?(1)

puts hash1.has_value?(5)

puts hash1.has_value?(2)

