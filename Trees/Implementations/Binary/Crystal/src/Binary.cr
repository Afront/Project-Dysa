# TODO: Write documentation for `Binary`
module Binary
  VERSION = "0.1.0"

  class Node(T)
    property data
    getter left : Node(T)?, right : Node(T)?

    def initialize(@data : T)
      left = nil
      right = nil
    end

    def set(data : T)
      raise "Already set" if data != nil
      @data = data
    end

    def update(@data : T)
    end
  end
end
