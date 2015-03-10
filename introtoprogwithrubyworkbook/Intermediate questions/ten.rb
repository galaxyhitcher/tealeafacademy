# ten.rb

hash = {
  "Herman" => {"age" => 32, "gender" => "male" },
  "Lily" => {"age"=> 30, "gender" => "female"},
  "Grandpa" => {"age" => 402, "gender" => "male" },
  "Eddie" => {"age" => 10, "gender" => "male" },
  "Marilyn" => {"age" =>23, "gender" => "female"}
}

hash.each do |name,attributes|

  if attributes["age"] < 18

    attributes["demographic"] = "kid"

  elsif attributes["age"] < 65

    attributes["demographic"] = "adult"

  else

    attributes["demographic"] = "senior"

  end

end

puts hash