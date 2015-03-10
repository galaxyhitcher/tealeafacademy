# ten.rb

arr = %w(Fred Barney Wilma Betty BamBam Pebbles)

arr.map! { |name| name[0,3]}

puts arr.to_s