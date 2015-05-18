
# The Object Model

# 1.) An object can be created by defining a class, and instantiating an instance
# by using the .new method to create an instance, also known as an object. For example:
class Bear
end

teddy = Bear.new



# 2&3.) A module allows us to group reusable code into one place.  Modules can be
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

# 1.)

class MyCar
  attr_accessor :color
  attr_reader :year
  def initialize(year,color,model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great"
  end

end

herbie = MyCar.new 1991 "yellow" "VW Bug"

herbie.change_and_view_color("red")

