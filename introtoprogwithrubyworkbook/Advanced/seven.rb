# seven.rb

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")

  # tests to see if there are 4 dot separated words
  if dot_separated_words.size != 4
    return false
  end


  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    # tests to see if word is not a number
    if !is_a_number?(word)
      return false
    end
  end
  return true
end


