# nine.rb

arr_hash = {"Fred"=>0,"Wilma"=>1,"Barney"=>2,"Betty"=>3,"BamBam"=>4,"Pebbles"=>5}

barneys_name_number = arr_hash.assoc("Barney")

# part 2

arr = ["Fred","Barney","Wilma","Betty","Pebbles","BamBam"]

flinstones = Hash.new

arr.each_with_index do |name, index|

  flinstones[name] = index

end

puts flinstones

