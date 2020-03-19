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
  end
end
