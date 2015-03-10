hash = {"Herman" =>32,"Lily" =>30, "Grandpa"=>5843,"Eddie"=>10,"Marilyn"=>22,"Spot"=>237}

age_total = 0

hash.each do |name, age|

  age_total += age

end

puts age_total