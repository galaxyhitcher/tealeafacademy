# eight.rb

class String

  def pretty_short_version(length = 32)
    
    dup = self.dup
    dup = dup.split(/\W/).reverse!
    result = Array.new
    while result.join(" ").length < length - 3
      result << dup.pop
      if result.join(" ").length > length - 3
        result.pop()
        return result.join(" ") + "..."

      end
    end
    result.join(" ") + "..."
  end

end

str = "I thought I would sail about a little and see the watery part of the world. It is a way I have of driving off the spleen and regulating the circulation."

puts str.pretty_short_version(50)

puts str.pretty_short_version(50).size

puts str.pretty_short_version(25)

puts str.pretty_short_version(25).size
