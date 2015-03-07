# thirteen.rb

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
                ["sally@email.com","404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contacts.keys.each_with_index do |name,index|
  contacts[name][:email] = contact_data[index][0]
  contacts[name][:address] = contact_data[index][1]
  contacts[name][:phone] = contact_data[index][2]
end

# to find Joe's email

puts contacts["Joe Smith"][:email]

# to find Sally's phone number

puts contacts["Sally Johnson"][:phone]


