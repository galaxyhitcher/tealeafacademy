# three.rb 

# A. the following will be returned:

# "one is: one"
# "two is two"

# "three is three"

def mess_with_vars(one, two, three)
    one = two
    two = three
    three = one
  end

  one = "one"
  two = "two"
  three = "three"

  mess_with_vars(one, two, three)

  puts "one is: #{one}"
  puts "two is: #{two}"
  puts "three is: #{three}"

  # B. the following is printed:

  # one is: one

  # two is: two

  # three is: three

  def mess_with_vars(one, two, three)
      one = "two"
      two = "three"
      three = "one"
    end

    one = "one"
    two = "two"
    three = "three"

    mess_with_vars(one, two, three)

    puts "one is: #{one}"
    puts "two is: #{two}"
    puts "three is: #{three}"

    # the following will be printed since the gsub! method modifies the caller:

    # "one is: two"

    # "two is: three"

    # "three is: one"

    def mess_with_vars(one, two, three)
      one.gsub!("one","two")
      two.gsub!("two","three")
      three.gsub!("three","one")
    end

    one = "one"
    two = "two"
    three = "three"

    mess_with_vars(one, two, three)

    puts "one is: #{one}"
    puts "two is: #{two}"
    puts "three is: #{three}"