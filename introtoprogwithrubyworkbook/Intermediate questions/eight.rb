# eight.rb

str = "the rain in spain falls mainly on the plain"

def titleize!(astring)

  words = astring.split(" ")

  words.each do |word|

    unless (word == "a" || word == "an" || word == "the")

      word.capitalize!
    end

    words[0].capitalize!

  end

  words.join(" ")



end


puts titleize!(str)