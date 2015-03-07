def execute(&block)

  block

end

execute { puts "Hello from inside the execute method!" }.call

# Now the Proc object is activated using the .call method.