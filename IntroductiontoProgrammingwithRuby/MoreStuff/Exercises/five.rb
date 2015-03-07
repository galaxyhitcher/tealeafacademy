def execute(block)
  block.call
end

execute { puts "Hello from inside the execute method!" }

# This code gives us an error since we are missing the & inside the arguments for the execute method.
# The & tells us that the method accepts a block.