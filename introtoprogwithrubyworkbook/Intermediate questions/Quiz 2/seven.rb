# seven.rb

munster_hash = {
  
  "Herman" => {"age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female" }



}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"

  end

end

mess_with_demographics(munster_hash)

puts munster_hash

# The method mess_with_demographics modified the caller, the elements of munster_hash are modified
# in the mess_with_demographics method.