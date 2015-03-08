def long_string(astring)
  if astring.length > 10
    astring.upcase
  else
    astring
  end

end

puts long_string('42 is the answer to life, the universe, and everything')

puts long_string('updog')