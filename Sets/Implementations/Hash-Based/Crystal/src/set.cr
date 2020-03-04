# TODO: Write documentation for `Set`
module NewSet
  VERSION = "0.1.0"

  class BaseSet(T)
    def initialize
      @hash = Hash(T, Nil).new
    end

    def initialize(enumerable : Enumerable(T))
      @hash = Hash(T, Nil).new

      enumerable.each do |key|
        @hash[key] = nil
      end
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
