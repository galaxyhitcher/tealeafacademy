# fourB.rb

da_string = "10"
puts da_string.object_id
ary = [1, 2, 3, 4]
da_lamb = lambda { |input| da_string.gsub!(/\d0/,(input * 10).to_s) }
ary.each &da_lamb
puts da_string

# prints:
# 40