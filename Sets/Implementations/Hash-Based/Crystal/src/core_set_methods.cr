module CoreSetMethods(T)
  def union(other : StaticSet(U)) forall U
    array = [] of U | T

    each do |key|
      array << key
    end

    other.each do |key|
      array << key
    end

    new_set = StaticSet.new array
  end

  def |(other : StaticSet(U)) forall U
    union other
  end

  def ∪(other : StaticSet(U)) forall U
    union other
  end

  def intersection(other : StaticSet(U)) forall U
    StaticSet.new(self.select { |element| other.includes? element })
  end

  def ∩(other : StaticSet(U)) forall U
    intersection other
  end

  def difference(other : StaticSet(U)) forall U
    StaticSet.new(other.reject { |element| includes? element })
  end

  def -(other : StaticSet(U)) forall U
    difference(other)
  end

  def subset?(other : StaticSet(U)) forall U
    map { |element| other.includes? element }.all?(true)
  end

  def superset?(other : StaticSet(U)) forall U
    other.subset?(self)
  end
end
