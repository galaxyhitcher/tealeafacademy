# three.rb

# loops through keys and prints them

def print_keys(hash1)

  hash1.keys.each do |key|

    puts key

  end

end


# loops through values and prints them

def print_values(hash1)

  hash1.values.each do |value|

    puts value

  end

end


# loops through keys and values and prints both

def prints_both(hash1)

  hash1.each do |k,v|

    puts k.to_s + ", " + v.to_s

  end

end


ahash = { :a => 1, :b => 2, :c => 3, :d => 4 }

print_keys(ahash)

puts

print_values(ahash)

puts

prints_both(ahash)