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
  end
end
