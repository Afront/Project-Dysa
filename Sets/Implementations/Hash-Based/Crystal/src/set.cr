# TODO: Write documentation for `Set`
module NewSet
  VERSION = "0.1.0"

  class BaseSet(T)
    include Enumerable(T) # for `join`

    # include Comparable(BaseSet)

    def initialize
      @hash = Hash(T, Nil).new
    end

    def initialize(enumerable : Enumerable(T))
      @hash = Hash(T, Nil).new

      enumerable.each do |key|
        @hash[key] = nil
      end
    end

    # Converts the base set into a string
    #
    # ```
    # BaseSet.new([1, 2]).to_s # => "[1,2]"
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
    # BaseSet.new([1, 2]).to_s # => "[1,2]"
    # ```
    def inspect(io : IO) : Nil
      to_s io
    end

    def each
      @hash.each_key do |key|
        yield key
      end
    end

    def union(other : Set(U)) forall U
      other.each do |key|
        @hash[key] = nil
      end
    end

    def intersection
    end

    def difference
    end

    def subset
    end
  end
end
