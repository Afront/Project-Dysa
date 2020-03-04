# Implements a stack
class Stack(T)
  VERSION = "0.1.0"

  # Initializes a stack without any arguments (aside from the type of course)
  #
  # ```
  # Stack(Int32).new.to_a # => []
  # ```
  def initialize
    @array = [] of T
  end

  # Initializes a stack with an *initial_capacity*
  #
  # ```
  # Stack(Int32).new(1).to_a # => []
  # ```
  def initialize(initial_capacity : Int)
    @array = Array(T).new(initial_capacity)
  end

  # Initializes a stack of the *size* given the that contains only the given *value*
  #
  # ```
  # Stack.new(2, 10).to_a # => [10,10]
  # ```
  def initialize(size : Int, value : T)
    @array = Array.new(size, value)
  end

  # Initializes a stack with an *array*
  #
  # ```
  # Stack.new([1, 2]).to_a # => [1,2]
  # ```
  def initialize(array : Array(T))
    @array = array
  end

  # Initializes a stack with a given *size* and a *block* that modifies the stack
  #
  # ```
  # Stack.new(2) { |i| i * 2 }.to_a # => [0,2]
  # ```
  def initialize(size : Int, &block : Int32 -> T)
    @array = Array.new(size, &block)
  end

  # Initializes a stack with an *array* and a *block* that modifies the stack
  #
  # ```
  # Stack.new([1, 2]) { |i| i + 1 }.to_a # => [2,3]
  # ```
  def initialize(array : Array(T), &block : Int32 -> T)
    @array = array.map(&block)
  end

  # Converts the stack into an array
  #
  # ```
  # Stack.new([1, 2]).to_a # => [1,2]
  # ```
  def to_a
    @array
  end

  # Looks at the last value (or the 'top') of the stack
  #
  # ```
  # Stack.new([1, 2]).peek # => 2
  # ```
  def peek
    @array[-1]
  end

  # Pushes a value into a stack
  #
  # ```
  # Stack.new([1, 2]).push(2).to_a # => [1,2,2]
  # ```
  def push(value : T)
    @array.push value
  end

  # Pops a value from a stack
  #
  # ```
  # Stack.new([1, 2]).pop # => 2
  # ```
  def pop
    @array.pop
  end

  # Compares the stack with another stack based on their values
  #
  # ```
  # Stack.new([1, 2]) == Stack.new([1, 2]) # => true
  # ```
  def ==(other : Stack)
    @array == other.to_a
  end
end
