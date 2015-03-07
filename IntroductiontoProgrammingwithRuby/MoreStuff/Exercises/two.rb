def execute(&block)

  block

end

execute { puts "Hello from inside the execute method!" }

# Nothing is printed since Proc is not executed using .call method.  Method returns Proc object,
# i.e. a block wrapped inside a Proc.

