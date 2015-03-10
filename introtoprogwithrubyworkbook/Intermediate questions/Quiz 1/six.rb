# six.rb

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

puts rolling_buffer1(["a","b","c","d","e"],5,"f").to_s

puts rolling_buffer2(["a","b","c","d","e"],5,"f").to_s

# rolling_buffer2 is a better method since it does not modify the caller