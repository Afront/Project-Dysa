# TODO: Write documentation for `Binary`
module Binary
  VERSION = "0.1.0"

  class Node(T)
    property data, left : Node(T)?, right : Node(T)?

    def initialize(@data : T)
      left = nil
      right = nil
    end

    def set(data : T)
      raise "Already set" unless data.nil?
      @data = data
    end

    def set_left(data : T)
      left = Node.new(data)
    end

    def set_right(data : T)
      right = Node.new(data)
    end

    def update(@data : T)
    end

    def number_of_children
      [self.left, self.right].compact.size
    end

    def insert(data : T)
      all_array = [self.left, self.right]

      while !nil || all_array.flatten.first.number_of_children == 2
        all_array.shift
      end

      if all_array.first.left.nil?
        all_array.first.set_left(data)
      elsif all_array.first.right.nil?
        all_array.first.set_right.update(data)
      end
    end
  end
end
