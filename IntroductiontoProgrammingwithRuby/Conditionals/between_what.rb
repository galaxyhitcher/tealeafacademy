def between_what(number)

  
  
  if (number >= 0) && (number < 50)

    return "the number is between 0 and 50"

  elsif (number >= 50) and (number <= 100)

    return "the number is between 50 and 100"

  elsif (number > 100)

    return "the number is greater than 100"

  else

    return "the input is none of the above"

  end

end

puts between_what(1000)

puts between_what(-4)

