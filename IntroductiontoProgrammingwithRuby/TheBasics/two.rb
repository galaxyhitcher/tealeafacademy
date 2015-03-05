puts ((1234 - 1234 % 1000)/1000).to_s + ' thousand(s)'
puts (((1234%1000) - (1234%1000)%100)/100).to_s + ' hundred(s)'
puts ((1234%100 - 1234%10)/10).to_s + ' ten(s)'
puts (1234%10).to_s + ' ones'