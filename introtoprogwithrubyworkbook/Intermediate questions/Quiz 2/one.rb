# one.rb

hash = {
  "Herman" => {"age" => 32,"gender" =>"male"},
  "Lily" => {"age" => 30,"gender" =>"female"},
  "Grandpa" => {"age" =>402 ,"gender" =>"male"},
  "Eddie" => {"age" =>10 ,"gender" =>"male"}
}

total_age_of_males = 0

hash.each do |name, values|

  if values["gender"] == "male"

    total_age_of_males += values["age"]

  end


end

puts total_age_of_males

