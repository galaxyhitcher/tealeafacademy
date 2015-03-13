# five.rb 
def generate_uuid

  def get_letter

    ["a","b","c","d","e","f"].sample

  end

  def get_number
    [0,1,2,3,4,5,6,7,8,9].sample

  end

  def number_or_letter

    ["number","letter"].sample

  end

  def get_number_or_letter

    if number_or_letter == "number"

      get_number

    else

      get_letter

    end

  end

  str = ""

  8.times do
    str += get_number_or_letter.to_s
  end

  str += '-'

  4.times do
    str += get_number_or_letter.to_s
  end

  str += "-"

  4.times do
    str += get_number_or_letter.to_s
  end

  str += "-"

  4.times do
    str += get_number_or_letter.to_s
  end

  str += "-"

  12.times do
    str += get_number_or_letter.to_s
  end

  str

end

puts generate_uuid