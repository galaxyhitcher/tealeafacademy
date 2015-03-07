# fourteen.rb

# this assumes contact data is in the same order as contacts,

# this also assumes hashes preserve ordering

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
                ["sally@email.com","404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

fields = [:email, :address, :phone]

i = 0

contacts.each do |key, value|
  fields.each_with_index do |field, j|
    contacts[key][field] = contact_data[i][j]
  end
  i += 1

end

puts contacts