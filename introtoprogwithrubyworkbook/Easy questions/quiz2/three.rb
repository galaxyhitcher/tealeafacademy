# three.rb

hash = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 } 

hash.delete_if {|key,value| value > 100}

puts hash.to_s