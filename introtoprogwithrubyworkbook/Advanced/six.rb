# six.rb

class String
  def map_words!
    # finds the punctuation in a string, assigns this punctuation to a local variable 'punctuation'
    punctuation = self.match(/\p{Punct}$/)[0] || ''
    # creates an array which stores the words in a string as elements
    ary = self.split(/\W/)
    # modifies elements of ary using map! function
    ary.map! { |word| yield word }
    # replaces original string with new string
    self.replace( ary.join(' ') + punctuation )
    # returns the modified string
    return self
  end
end

str = "Herman Munster is a BIG BIG man."

str.map_words!{|x| x.reverse}

# I do not fully understand this code, but I have commented on what I believe each line of code does.