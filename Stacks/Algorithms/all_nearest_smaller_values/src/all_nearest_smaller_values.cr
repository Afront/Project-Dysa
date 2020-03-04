require "stack"

# TODO: Write documentation for `AllNearestSmallerValues`
module AllNearestSmallerValues(T)
  VERSION = "0.1.0"

  def self.get_all_nearest_smaller_values(array : Array(T))
    stack = Stack(T).new
    new_array = Array(T).new

    array.each do |i|
      while !stack.empty? && stack.peek >= i
        stack.pop
      end

      new_array << stack.peek unless stack.empty?
      stack.push i
    end

    new_array
  end
end
