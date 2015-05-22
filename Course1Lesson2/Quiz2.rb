# 1.) 
# a.) local variable, Fixnum object with value 1
# b.) instance variable, Fixnum object with value 2
# c.) user is a new instance object of the class User 
# d.) the object user is calling the name getter instance method
# e.) the object user is calling the name setter instance method, resetting the object's string value to "Joe"

# 2.) if you have a module called Runnable, you can mixin the module by doing the following:

class Marathoners
  include Runnable

  #code for class here

end

# 3.) Answer: A class variable is shared among the class and all of its descendants. It also begins with two @@ symbols. An instance variable is not shared by the class' descendants and it begins with one @ symbol.

  # 4.) attr_accessor provides getter and setter methods for instance variables

# 5.)  The class Dog is calling the method some_method.

# 6.) Subclassing is when the classes is a relationship and has a single inheritance. For example, a Dog subclass will inherit all of the behaviors of  an Animal superclass. 

# Mixing in modules is called composition and it is when classes have a relationship. This is usually when classes have multiple inheritances or when certain behaviors are shared among classes, but not every single one of them. 

# 7.)  

class User
  def initialize(name)
    self.name = name
  end
end

# 8.) Yes

# 9.) Use Pry gem.