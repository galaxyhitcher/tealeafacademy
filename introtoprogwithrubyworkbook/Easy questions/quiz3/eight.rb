# eight.rb

arr = %w(Fred Barney Wilma Betty BamBam Pebbles)

arr.sort! {|a,b| a.size <=> b.size}

puts arr.to_s