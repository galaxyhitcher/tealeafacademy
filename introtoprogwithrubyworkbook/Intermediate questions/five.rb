# five.rb

def factors(number)

  dividend = number

  divisors = []

  while dividend > 0

    divisors << number / dividend if number % dividend == 0

    dividend -= 1

  end

  divisors

end

puts factors(500).to_s

# Bonus 1: What is the purpose of the number % dividend == 0 ?

# This returns a boolean that tells us whether the number is evenly divisible by the dividend

# Bonus 2: The second to last line essentially makes the method return an array of all the divisors
# of a given number