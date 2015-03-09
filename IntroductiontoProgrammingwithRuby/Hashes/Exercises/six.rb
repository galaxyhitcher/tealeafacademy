# six.rb

words = ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
         'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
# eight.rb

arr = %w(Fred Barney Wilma Betty BamBam Pebbles)

arr.sort! {|a,b| a.size <=> b.size}

puts arr.to_s
def count_letters(word)

  alphabet = ["a","b","c","d","e","f","g","h","i",'j',"k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

  letter_count = Hash.new

  for letter in word.split('')

    for character in alphabet

      if letter == character

        if letter_count[character]

          letter_count[character] += 1

        else

          letter_count[character] = 1

        end

      end

    end

  end

  letter_count

end


def print_groups_of_anagrams(array_of_words)

  # make a new Hash where the keys are the words in the words array and the values are hashes of letter counts generated from the letter_count function

  letter_counts = Hash.new

  array_of_words.each do |word|

    letter_counts[word] = count_letters(word)

  end

  # Hash_A and Hash_B are equal if Hash_A == Hash_B, so we will use values from letter_counts, i.e. each value from the letter_counts Hash will be a keys
  # in the anagrams_hash.

  anagrams_hash = Hash.new

  letter_counts.each do |word, count|

    if anagrams_hash[count]

      anagrams_hash[count] << word

    else

      anagrams_hash[count] = Array.new

      anagrams_hash[count][0] = word

    end

  end

  # Now, for the last step, the values in anagrams_hash are the arrays of anagrams we are looking for

  anagrams_array = Array.new

  anagrams_hash.each do |k,v|

    anagrams_array << v

  end

  anagrams_array.each do |array|

    puts array.to_s

  end

end

print_groups_of_anagrams(words)