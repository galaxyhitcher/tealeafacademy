# nine.rb

arr = %w(Fred Barney Wilma Betty BamBam Pebbles)

arr.sort! {|a,b| b.size <=> a.size}

puts arr.to_s