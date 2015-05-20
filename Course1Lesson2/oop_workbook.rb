#Quiz 1
# 1.)
  # 1.) true is an object of class TrueClass
  # 2.) "hello" is an object of class String
  # 3.) [1, 2, 3, "happy days"] is an object of class Array
  # 4.) 142 is an object of class Fixnum
  # if you call the .class method on an object, it will return the class of that object

# 2.) if we mixin the Speed module into the Car and Truck classes, these classes
# will inherit the behavior of the Speed module.  We can check if this has worked
# by calling the go_fast method on instances of Car and Truck.

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

honda = Car.new

honda.go_fast

chevy = Truck.new

chevy.go_fast

# 3.) self.class works in the method in the following way:
  # 1.) self refers to the object itself, i.e. a Car or a Truck object
  # 2.) we ask self to tell us it's class with self.class, it tells us
  # 3.) We don't need to use to_s, since self.class is inside of a string interpolation which means it will take care of to_s for us.

#4.)

class AngryCat
  def hiss
    puts "Hisssss!"
  end
end

chester = AngryCat.new

#5.)

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

apple = Fruit.new("cheese")

pepperoni = Pizza.new("cake")

puts apple.instance_variables

puts pepperoni.instance_variables

# the Pizza class has instance variables, the Fruit class does not.

#6.)  
class Cube
  attr_accessor :volume
  def initialize(volume)
    @volume = volume
  end
end

#7.)  by default, if you call the to_s method, you are telling Ruby to print out the object's class and an encoding of the object id to the console.
  # You could find this detail in the Ruby documentation.

#8.)  self is referring to the object that is calling the method, i.e. the calling object.  In this case, the calling object is an instance of a Cat.

#9.)  In this case, self refers to the Cat class.

#10.)  

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

burlap_sack = Bag.new("brown","burlap")


# Quiz 2

# 1.)
class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

oracle = Oracle.new

puts oracle.predict_the_future

# an element will be randomly chosen from the array returned by the choices method and a message will be printed out, i.e. "You will stay at work late."

# 2.) 
class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new

puts trip.predict_the_future

# Since choices is a method in RoadTrip, the array in RoadTrip will be the one randomly chosen from.

#3.)  

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

puts Orange.ancestors

puts HotSauce.ancestors

#4.)

class BeesWax
  attr_accessor :type
  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end

# 5.)
#excited_dog = "excited dog"
#@excited_dog = "excited dog"
#@@excited_dog = "excited dog"

# local variable - excited_dog
  #instance variable - @excited_dog
  #class variable - @@excited_dog

# 6.)

class Television
  def self.manufacturer
    # method logic
  end 

  def model
    # method logic
  end
end

# here, self.manufacturer is a class method, since class methods in ruby start with self.

# you would call this method by using the class name and then calling the method, i.e. Television.manufacturer

#7.)

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

#@@cats_count is a class variable which keeps track of the number of cats which have been initialized

tabby = Cat.new("fat")

garfield = Cat.new("striped")

macavity = Cat.new("clever")

puts Cat.cats_count

#8.)  
class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game

  def rules_of_play
    #rules of play
  end
end

new_game = Bingo.new

puts new_game.play

#9.)  the play method from the Bingo class would be executed when a the play method is called on a Bingo object. 

#Quiz 3

#1.) case 1: Hello is printed to the screen, and nil is returned
# case 2: NoMethodError: undefined method `bye' for #<Hello:0x007f996b296498>
# case 3: ArgumentError: wrong number of arguments (0 for 1)
# case 4: Goodbye is printed to the screen and nil is returned
# case 5: NoMethodError: undefined method `hi' for Hello:Class

#2.) you could add a class method hi
class Hello
  def self.hi
    greeting = Greeting.new
    greeting.greet("Hello")
  end
end

# 3.)

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name 
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

tabby = AngryCat.new(5,"evelyn")

stray = AngryCat.new(7,"Thomas O' Malley")

# 4.)  
class Cat
  attr_accessor :type
  def initialize(type)
    @type = type
  end

  def to_s
    puts "I am a #{self.type} cat."
  end
end

tabby = Cat.new("tabby")

tabby.to_s

# 5.) 

# 6.) instead of self.age += 1, we could use @age += 1

# 7.) return in the information method does not add any value

# Intermediate Quiz 1

# 1.) Ben is right because he added an attr_reader method to his BankAccount class.

# 2.) There is no setter method for quantity, so it must be set with the @quantity notation.  
# 3.) You are altering the public interfaces of the class which could pose problems down the line.

#4.) 

# class Greeting
#   def greet(astring)
#     puts astring
#   end
# end

# class Hello < Greeting
#   def hi
#     greet("hi")
#   end
# end

# class Goodbye < Greeting
#   def bye
#     greet("bye")
#   end
# end

# 5.)

class KrispyKreme
  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  def to_s
    filling_string = @filling_type ? @filling_type : "Plain"
    glazing_string = @glazing ? " with #{@glazing}" : ''
    filling_string + glazing_string
  end

end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1

puts donut2

puts donut3

puts donut4

puts donut5

# 6.) There is no difference aside from stylistic concerns

# 7.) change the method name self.light_information to self.information

class Light
  attr_accessor :brightness, :color


  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    "I want to turn on the light with a brightness level of super high and a colour of green"
  end

end

# Advanced Quiz 1

# 1.) 

class SecretFile
  attr_reader :data

  def initialize(secret_data, logger)
    @data = secret_data
    @logger = logger
  end

  def data
    @logger.create_log_entry
    @data
  end
end

# 2.)

module Moveable


class WheeledVehicle
  attr_accessor :speed, :heading
  attr_writer :fuel_capacity, :fuel_efficiency

  def range
    @fuel_capacity*@fuel_efficiency
  end
end

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class Auto < WheeledVehicle
  include Moveable
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures along with 
    super([20,20], 80, 8.0)
  end
end

# 3.)

class Seacraft
  include Moveable

  attr_accessor :hull_count, :propeller_count

  def initialize(num_propellers, num_hulls, fuel_efficiency, fuel_capacity)
    @propeller_count = num_propellers
    @hull_count = num_hulls
    @fuel_efficiency = fuel_efficiency
    @fuel_capacity = fuel_capacity
  end

  def range
    range_by_using_fuel = super
    return range_by_using_fuel + 10
  end
  
end

class Motorboat < Seacraft
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    # set up 1 hull and 1 propeller
    super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end

class Catamaran < Seacraft
  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    super(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end

# 4.)  
