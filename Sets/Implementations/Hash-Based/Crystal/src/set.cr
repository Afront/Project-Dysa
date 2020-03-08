require "./set_methods"

# TODO: Write documentation for `Set`
module NewSet
  VERSION = "0.1.0"

  # TODO: Turn BaseSet into an abstract/virtual class?
  class BaseSet(T)
    include SetMethods(T)

    def initialize
      @hash = Hash(T, Nil).new
    end

    def initialize(enumerable : Enumerable(T))
      @hash = Hash(T, Nil).new

      enumerable.each do |key|
        @hash[key] = nil
      end
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
      map { |element| other.includes? element }.all?(true)
    end

    def superset?(other : BaseSet(U)) forall U
      other.subset?(self)
    end
  end
end
