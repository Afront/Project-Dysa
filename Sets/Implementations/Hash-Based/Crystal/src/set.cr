# TODO: Write documentation for `Set`
module NewSet
  VERSION = "0.1.0"

  # TODO: Turn BaseSet into an abstract/virtual class?
  class BaseSet(T)
    include Enumerable(T) # for `join`
    include Comparable(BaseSet)

    def initialize
      @hash = Hash(T, Nil).new
    end

    def initialize(enumerable : Enumerable(T))
      @hash = Hash(T, Nil).new

      enumerable.each do |key|
        @hash[key] = nil
      end
    end

    # Converts the base set into an array
    #
    # ```
    # BaseSet.new([1, 2, 2]).to_a # => [1,2]
    # ```
    def to_a
      @hash.keys
    end

    # Converts the base set into a string
    #
    # ```
    # BaseSet.new([1, 2]).to_s # => "{1,2}"
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
    # BaseSet.new([1, 2]).to_s # => "{1,2}"
    # ```
    def inspect(io : IO) : Nil
      to_s io
    end

    def each
      @hash.each_key do |key|
        yield key
      end
    end

    # Adds a value into a stack
    # NOTE: I just realized this operator is only part of dynamic sets, but this is the easiest way to implement `#union`
    # ```
    # BaseSet.new([1, 2]).add(2) # => {1,2,2}
    # ```
    def add(element : T)
      @hash[element] = nil
      self
    end

    # Adds a value into a stack
    #
    # NOTE: I might add a #push method as well if needed...
    #
    # ```
    # BaseSet.new([1, 2]).add(2) # => {1,2,2}
    # ```
    def <<(element : T)
      add element
    end

    def union(other : BaseSet(U)) forall U
      new_set = BaseSet(U | T).new

      each do |key|
        new_set << key
      end

      other.each do |key|
        new_set << key
      end

      new_set
    end

    def |(other : BaseSet(U)) forall U
      union other
    end

    def ∪(other : BaseSet(U)) forall U
      union other
    end

    def intersection(other : BaseSet(U)) forall U
      BaseSet.new(self.select { |element| other.includes? element })
    end

    def ∩(other : BaseSet(U)) forall U
      intersection other
    end

    def difference(other : BaseSet(U)) forall U
      BaseSet.new(other.reject { |element| includes? element })
    end

    def -(other : BaseSet(U)) forall U
      difference(other)
    end

    def subset?(other : BaseSet(U)) forall U
      other.map { |element| includes? element }.all? { |bool| bool == true }
    end

    def superset?(other : BaseSet(U)) forall U
      other.subset?(self)
    end

    def <=>(other : BaseSet(U)) forall U
      to_a.sort <=> other.to_a.sort
    end
  end
end
