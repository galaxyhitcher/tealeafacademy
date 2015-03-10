# ten.rb

arr = %w( fred Barney Wilma betty BamBam Pebbles)

arr.sort! { |a,b| a.casecmp(b)}

puts arr.to_s

