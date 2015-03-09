# five_and_six.rb

hash = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10}

rest = { "Marilyn" => 22, "Spot" => 237 }

puts hash.merge!(rest).to_s

puts "the minimum age is: " + (hash.min_by {|key,value| value})[1].to_s

