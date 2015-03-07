# two.rb

# The #merge method returns the result of merging two hashes without desctructively modifying
# either hash.  However, if you use the #merge! method like so: arr1.merge(arr2), arr1 will be
# overwritten by the hash returned by arr1.merge(arr2).


def merge_without_destructive_modification(h1,h2)

  puts "the result of #{h1}.merge(#{h2}) is #{h1.merge(h2)}"

  puts

  puts "the value of the first array, #{h1} is unchanged"

  puts

end


def merge_with_destructive_modification(h1,h2)

  puts "the result of #{h1}.merge!(#{h2}) is #{h1.merge!(h2)}"

  puts

  puts "the value of the first array, #{h1} is changed"

  puts

end


hash1 = { :a => 1, :b => 2, :c => 3 }

hash2 = { :c => 4, :d => 5, :e => 6 }

puts

merge_without_destructive_modification(hash1,hash2)

merge_with_destructive_modification(hash1,hash2)






