# TODO: Write documentation for `Stack`
class Stack(T)
  VERSION = "0.1.0"

  def initialize
    @array = [] of T
  end

  def initialize(initial_capacity : Int)
    @array = Array(T).new(initial_capacity)
  end

  def initialize(size : Int, value : T)
    @array = Array.new(size, value)
  end

  def initialize(size : Int, &block : Int32 -> T)
    @array = Array.new(size, &block)
  end

  def initialize(array : Array(T))
    @array = array
  end

  def initialize(array : Array(T), &block : Int32 -> T)
    @array = array.map(&block)
  end

  def to_a
    @array
  end

  def push(value : T)
    @array.push value
  end

  def pop
    @array.pop
  end

  def ==(other : Stack)
    @array == other.to_a
  end
end
