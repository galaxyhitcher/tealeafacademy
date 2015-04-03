class Animal
  attr_accessor :name

  def initialize(n)
    @name = n
  end
  def eat
    "#{name} is eating"
  end

end

class Dog < Animal

end

class Cat < Animal
  
end

# teddy = Dog.new('teddy')
# puts teddy.name

# kitty = Cat.new('kitty')
# puts kitty.name

puts Dog.ancestors