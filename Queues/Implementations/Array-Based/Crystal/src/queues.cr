require "stack"

# TODO: Write documentation for `Queues`
module Queues
  VERSION = "0.1.0"

  class Queue(T)
    # Initializes a queue without any arguments (aside from the type of course)
    #
    # ```
    # Stack(Int32).new.to_a # => []
    # ```
    def initialize
      @stack = Stack.new
    end

    # Initializes a queue with an *initial_capacity*
    #
    # ```
    # Stack(Int32).new(1).to_a # => []
    # ```
    def initialize(initial_capacity : Int)
      @stack = Stack.new(initial_capacity)
    end

    # Initializes a queue of the *size* given the that contains only the given *value*
    #
    # ```
    # Stack.new(2, 10).to_a # => [10,10]
    # ```
    def initialize(size : Int, value : T)
      @stack = Stack.new(size, value)
    end

    # Initializes a queue with an *array*
    #
    # ```
    # Stack.new([1, 2]).to_a # => [1,2]
    # ```
    def initialize(array : Array(T))
      @stack = Stack.new(array)
    end

    # Initializes a queue with a given *size* and a *block* that modifies the queue
    #
    # ```
    # Stack.new(2) { |i| i * 2 }.to_a # => [0,2]
    # ```
    def initialize(size : Int, &block : Int32 -> T)
      @stack = Stack.new(size, &block)
    end

    # Initializes a queue with an *array* and a *block* that modifies the queue
    #
    # ```
    # Stack.new([1, 2]) { |i| i + 1 }.to_a # => [2,3]
    # ```
    def initialize(array : Array(T), &block : Int32 -> T)
      @stack = array.map(&block)
    end

    # Converts the queue into an array
    #
    # ```
    # Stack.new([1, 2]).to_a # => [1,2]
    # ```
    def to_a
      @stack.to_a
    end

    # Converts the queue into a string
    #
    # ```
    # Stack.new([1, 2]).to_s # => "[1,2]"
    # ```
    def to_s(io : IO) : Nil
      @stack.to_s io
    end

    # "Appends the String representation" of the queue
    #
    # ```
    # Stack.new([1, 2]).to_s # => "[1,2]"
    # ```
    def inspect(io : IO) : Nil
      to_s io
    end

    # Checks if the queue is empty or not
    #
    # ```
    # Stack(Int32).new.empty? # => true
    # ```
    def empty?
      @stack.empty?
    end

    # Looks at the last value (or the 'top') of the queue
    #
    # ```
    # Stack.new([1, 2]).peek # => 2
    # ```
    def peek
      @stack[-1]
    end

    # Pushes a value into a queue
    #
    # ```
    # Stack.new([1, 2]).push(2).to_a # => [1,2,2]
    # ```
    def unshift(value : T)
      @stack.push value
    end

    # Pops a value from a queue
    #
    # ```
    # Stack.new([1, 2]).pop # => 2
    # ```
    def shift
      @array.pop
    end

    # Compares the queue with another queue based on their values
    #
    # ```
    # Stack.new([1, 2]) == Stack.new([1, 2]) # => true
    # ```
    def ==(other : Queue)
      to_a == other.to_a
    end
  end
end
