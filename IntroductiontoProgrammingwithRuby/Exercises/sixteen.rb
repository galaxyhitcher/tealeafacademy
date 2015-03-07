# sixteen.rb

a = ['white snow', 'winter wonderland', 'melting ice', 'slippery sidewalk', 'salted roads', 'white trees']

b = Array.new

a.each do |e|
  b << e.split(' ')
end

b.flatten!

puts b.to_s