def equal_to_four(x)
  if x == 4
    puts "yup"
  else
    puts "nope"
end

equal_to_four(5)

# the following error message is generated:

#equal_to_four.rb:10: syntax error, unexpected $end, expecting keyword_end

#This error message is generated because the logical if..else statement is not closed by the end keyword.