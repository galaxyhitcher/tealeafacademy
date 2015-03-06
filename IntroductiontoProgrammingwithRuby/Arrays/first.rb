# number_in_array.rb

def number_in_array?(arr, num)
  
  arr.include?(num) ? :"#{num} is indeed an element of #{arr}" : "#{num} is not an element of #{arr}"

end


puts number_in_array?([1,3,5,7,9], 2)

puts number_in_array?([2,4,5,8,10],2)