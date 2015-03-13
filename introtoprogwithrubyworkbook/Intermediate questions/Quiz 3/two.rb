# two.rb 

hash = { 
    "Herman" => { "age" => 32, "gender" => "male" }, 
    "Lily" => { "age" => 30, "gender" => "female" }, 
    "Grandpa" => { "age" => 402, "gender" => "male" }, 
    "Eddie" => { "age" => 10, "gender" => "male" } 
}

i = 0

hash.each do |name, values|

  values["original-order"] = i

  i += 1

  values["name-length"] = name.length
  
end

puts hash