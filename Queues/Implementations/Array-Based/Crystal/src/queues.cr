require "stack"

# TODO: Write documentation for `Queues`
module Queues
  VERSION = "0.1.0"

  class Queue(T)
    def initialize
      @stack = Stack.new
    end
  end
end
