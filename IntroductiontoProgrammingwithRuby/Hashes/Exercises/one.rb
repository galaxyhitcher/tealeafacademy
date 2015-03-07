# Given

family = { uncles: ["bob", "joe", "steve"],
           sisters: ["jane","jill","beth"],
           brothers: ["frank","rob","david"],
           aunts: ["mary","sally","susan"] }

immediate_family_array = family.select {|k,v| k == :sisters || k == :brothers}.to_a

puts immediate_family_array.to_s