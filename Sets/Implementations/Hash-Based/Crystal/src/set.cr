require "./core_set_methods"

# TODO: Write documentation for `Set`
module NewSet
  VERSION = "0.1.0"

  class StaticSet(T)
    include Enumerable(T) # for `join`
    include Comparable(StaticSet)
    include CoreSetMethods(T)

    def initialize
      @hash = Hash(T, Nil).new
    end

    def initialize(enumerable : Enumerable(T))
      @hash = Hash(T, Nil).new

      enumerable.each do |key|
        @hash[key] = nil
      end
    end

    def initialize(*elements : T)
      initialize elements
    end

    # Converts the base set into an array
    #
    # ```
    # StaticSet.new([1, 2, 2]).to_a # => [1,2]
    # ```
    def to_a
      @hash.keys
    end

    # Converts the base set into a string
    #
    # ```
    # StaticSet.new([1, 2]).to_s # => "{1,2}"
    # ```
    def to_s(io : IO) : Nil
      is_executed = exec_recursive(:to_s) do
        io << '{'
        join ", ", io, &.inspect(io)
        io << '}'
      end
      io << "{...}" unless is_executed # probably not needed
    end

    # "Appends the String representation" of the base set
    #
    # ```
    # StaticSet.new([1, 2]).to_s # => "{1,2}"
    # ```
    def inspect(io : IO) : Nil
      to_s io
    end

    def each
      @hash.each_key do |key|
        yield key
      end
    end

    def empty?
      @hash.empty?
    end

    def <=>(other : StaticSet(U)) forall U
      to_a.sort <=> other.to_a.sort
    end

    def cardinality
      size
    end
  end

  class DynamicSet(T) < StaticSet(T)
    def initialize(@capacity : Int32? = nil, @fixed : Bool? = false)
      super()
    end

    def initialize(enumerable : Enumerable(T))
      super
    end

    def initialize(*elements : T)
      super
    end

    # Adds a value into the set
    #
    # NOTE: I just realized this operator is only part of dynamic sets, but this is the easiest way to implement `#union`
    #
    # Originally planned on adding #push as an alias method (alongside <<)
    # Since I didn't know #add was the conventional method at that time
    #
    # ```
    # StaticSet.new([1, 2]).add(2) # => {1,2,2}
    # ```
    def add(element : T)
      # TODO: Should probably replace OverflowError with a custom error
      raise OverflowError.new("Set overflow: the size of the set exceeds the capacity") if @hash.size == @capacity && @fixed
      @hash[element] = nil
      self
    end

    # Adds a value into a set
    #
    # ```
    # StaticSet.new([1, 2]).add(2) # => {1,2,2}
    # ```
    def <<(element : T)
      add element
    end

    # Not sure if returning self is better than returning nil
    def add?(element : T)
      add element
    rescue OverflowError
      self
    end
  end
end

ary = Array(Int32).new(1)
ary.push 2, 3
