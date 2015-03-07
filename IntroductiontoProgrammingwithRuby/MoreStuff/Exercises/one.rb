# one.rb

def check_word_for_lab(to_check)

  if (to_check =~ /lab/)

    puts to_check

  end

end

words_to_check = ["laboratory","experiment","Pans Labyrinth","elaborate","polar bear"]

words_to_check.each do |word|

  check_word_for_lab(word)

end