str = "The Flinstones Rock"

alphabet = "abcdefghijklmnopqrstuvwxyz"

alphabet = alphabet.split('')

def is_letter?(alphabet_letter,string_letter)

  if string_letter == alphabet_letter

    return true

  elsif string_letter.downcase == alphabet_letter

    return true

  else

    return false

  end

end

results_hash = Hash.new

str.split('').each do |letter|

  alphabet.each do |alph_letter|

    if is_letter?(alph_letter,letter)
      if results_hash[alph_letter.upcase]
        results_hash[alph_letter.upcase] += 1
      else
        results_hash[alph_letter.upcase] = 1
      end

    end
  end
end

puts results_hash.to_s