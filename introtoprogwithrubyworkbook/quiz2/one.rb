hash = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

puts hash.has_key?("Spot")

# Hash#include?  Hash#member?  Hash#key?

puts hash.key?("Spot")

puts hash.member?("Spot")

puts hash.key?("Spot")