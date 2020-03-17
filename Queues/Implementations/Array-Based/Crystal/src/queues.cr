require "stack"

# TODO: Write documentation for `Queues`
module Queues
  VERSION = "0.1.0"

  class Queue(T)
    # Initializes a queue without any arguments (aside from the type of course)
    #
    # ```
    # Queue(Int32).new.to_a # => []
    # ```
    def initialize
      @stack = Stack(T).new
    end

    # Initializes a queue with an *initial_capacity*
    #
    # ```
    # Queue(Int32).new(1).to_a # => []
    # ```
    def initialize(initial_capacity : Int)
      @stack = Stack(T).new(initial_capacity)
    end

    # Initializes a queue of the *size* given the that contains only the given *value*
    #
    # ```
    # Queue.new(2, 10).to_a # => [10,10]
    # ```
    def initialize(size : Int, value : T)
      @stack = Stack(T).new(size, value)
    end

    # Initializes a queue with an *array*
    #
    # ```
    # Queue.new([1, 2]).to_a # => [1,2]
    # ```
    def initialize(array : Array(T))
      @stack = Stack(T).new(array)
    end

    # Initializes a queue with a given *size* and a *block* that modifies the queue
    #
    # ```
    # Queue.new(2) { |i| i * 2 }.to_a # => [0,2]
    # ```
    def initialize(size : Int, &block : Int32 -> T)
      @stack = Stack(T).new(size, &block)
    end

    # Initializes a queue with an *array* and a *block* that modifies the queue
    #
    # ```
    # Queue.new([1, 2]) { |i| i + 1 }.to_a # => [2,3]
    # ```
    def initialize(array : Array(T), &block : Int32 -> T)
      @stack = Stack.new(array.map(&block))
    end

    # Converts the queue into an array
    #
    # ```
    # Queue.new([1, 2]).to_a # => [1,2]
    # ```
    def to_a
      @stack.to_a
    end

    # Converts the queue into a string
    #
    # ```
    # Queue.new([1, 2]).to_s # => "[1,2]"
    # ```
    def to_s(io : IO) : Nil
      @stack.to_s io
    end

    # "Appends the String representation" of the queue
    #
    # ```
    # Queue.new([1, 2]).to_s # => "[1,2]"
    # ```
    def inspect(io : IO) : Nil
      to_s io
    end

    # Checks if the queue is empty or not
    #
    # ```
    # Queue(Int32).new.empty? # => true
    # ```
    def empty?
      @stack.empty?
    end

    # Looks at the last value (or the 'top') of the queue
    #
    # ```
    # Queue.new([1, 2]).peek # => 2
    # ```
    def peek
      @stack.peek
    end

    # Pushes a value into a queue
    #
    # ```
    # Queue.new([1, 2]).unshift(2).to_a # => [2, 1, 2]
    # ```
    def unshift(value : T)
      @stack.push value
    end

    # Pops a value from a queue
    #
    # ```
    # Queue.new([1, 2]).shift # => 1
    # ```
    def shift
      @stack.pop
    end

    # Compares the queue with another queue based on their values
    #
    # ```
    # Queue.new([1, 2]) == Stack(T).new([1, 2]) # => true
    # ```
    def ==(other : Queue)
      to_a == other.to_a
    end
  end
end
