# fourC.rb

da_string = ""
ary = [1, 2, 3, 4]
da_lamb = lambda { |input| da_string << (input * 10).to_s }
ary.each &da_lamb
puts da_string

# prints:
# 10203040

# this is because each loop appends two more digits to da_string