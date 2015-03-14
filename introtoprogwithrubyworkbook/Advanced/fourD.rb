# fourD.rb 

da_string = ""
ary = [1, 2, 3, 4]
da_lamb = lambda { |input| da_string = da_string + (input * 10).to_s }
ary.each &da_lamb
puts da_string

# this code snippet has the same effect as fourC, so it outputs:

# 10203040