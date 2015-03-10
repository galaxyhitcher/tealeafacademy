# seven.rb

LIMIT = 15

def fib(first_num,second_num)

  while second_num < LIMIT

    sum = first_num + second_num

    first_num = second_num

    second_num = sum

  end

  sum

end

result = fib(0,1)

puts "result is #{result}"

# making LIMIT a global constant will allow it to be accessed from within the fib method

# another option would be to make limit an argument of the fib method