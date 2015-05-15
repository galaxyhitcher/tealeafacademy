
# The Object Model

# 1.) An object can be created by defining a class, and instantiating an instance
# by using the .new method to create an instance, also known as an object. For example:
class Bear
end

teddy = Bear.new



# 2.) A module allows us to group reusable code into one place.  Modules can be
# used in classes by using the include reserved word, followed by the module name.
# Modules are used as a namespace.

module Hibernate
  def sleep
    puts "Sleeping until Spring..."
  end
end

class Bear
  include Hibernate
end

teddy = Bear.new

# Classes and Objects Part 1

class MyCar
  def initialize(year,color,model)
    self.year = year
    self.color = color
    self.model = model
  end
end

herbie = MyCar.new 1991 "yellow" "VW Bug"

