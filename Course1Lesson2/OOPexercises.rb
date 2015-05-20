
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

# Classes and Objects Part 1 and Part 2

# 1.)
module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :model, :year
  @@number_of_vehicles = 0

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def age
    "Your #{self.model} is #{years_old} years old."
  end

  private

  def years_old
    Time.now.year - self.year
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
    puts "Let's park this bad boy!"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def spray_paint(color)
    self.color = color
    puts "You new #{color} paint job looks great!"
  end
end

class MyTruck < Vehicle
  include Towable

  NUMBER_OF_DOORS = 2

  def to_s
    "My truck  is a #{self.color}, #{self.year}, #{self.model}!"
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "My car is a #{self.color}, #{self.year}, #{self.model}!"
  end
end

# Classes and Objects Part 2 Question 3

# there is no setter method for the instance variable @name.
# attr_reader must be changed to attr_writer or attr_accessor to be able to change the value of @name.

class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected

  def grade
    @grade
  end

end

joe = Student.new("joe", 90)

bob = Student.new("bob",80)

puts "Well done!" if joe.better_grade_than?(bob)
puts joe.grade

# Inheritance problem 8
# hi is a protected method, if the hi method is put above the private reserved word in the class, this should make the hi method available to the object
