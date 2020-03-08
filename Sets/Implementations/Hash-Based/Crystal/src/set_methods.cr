module SetMethods(T)
  include Enumerable(T) # for `join`
  include Comparable(SetMethods)

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

  def <=>(other : BaseSet(U)) forall U
    to_a.sort <=> other.to_a.sort
  end
end
