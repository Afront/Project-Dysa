describe StaticSet do
  describe "#initialize" do
    # it "cannot be initialized without any arguments" do
    #   StaticSet(Int32).new
    # end

    it "can be initialized from an enumerable" do
      StaticSet.new [1, 2, 3]
    end

    it "should only 'keep' one 'copy' of each element" do
      StaticSet.new([1, 2, 2, 3]).should eq(StaticSet.new([1, 2, 3]))
    end

    it "can create a new set based on the arguments" do
      StaticSet.new 1, 2, 3
    end
  end

  describe "#to_a" do
    it "should turn a set into an array based on its values" do
      StaticSet.new([1, 2, 2]).to_a.should eq([1, 2])
    end
  end

  describe "#to_s" do
    it "should turn a set into a string based on its values" do
      StaticSet.new([1, 2, 3]).to_s.should eq("{1, 2, 3}")
    end
  end

  describe "#inspect" do
    it "should 'return' the set as a string with brackets" do
      StaticSet(Int32).new.inspect.should eq("{}")
    end
  end

  describe "#union" do
    it "should return a set that contains elements from both sets" do
      StaticSet.new([-1, -2, -3]).union(StaticSet.new([1, 2, 3])).should eq(StaticSet.new([-1, -2, -3, 1, 2, 3]))
    end

    it "can use | as an alias" do
      (StaticSet.new([-1, -2, -3]) | StaticSet.new([1, 2, 3])).should eq(StaticSet.new([-1, -2, -3, 1, 2, 3]))
    end

    it "can use ∪ as an alias" do
      (StaticSet.new([-1, -2, -3]).∪ StaticSet.new([1, 2, 3])).should eq(StaticSet.new([-1, -2, -3, 1, 2, 3]))
    end

    it "must be associative" do
      a = [1, 2, 3]
      b = [2, 3, 4, 5]
      c = [0, -1, -2, -3]
      set1 = (StaticSet.new(a) | StaticSet.new(b)) | StaticSet.new(c)
      set2 = StaticSet.new(a) | (StaticSet.new(b) | StaticSet.new(c))
      set1.should eq(set2)
    end

    it "must be commutative" do
      a = [1, 2, 3]
      b = [2, 3, 4, 5]
      (StaticSet.new(a).∪ StaticSet.new(b)).should eq(StaticSet.new(b).∪ StaticSet.new(a))
    end

    it "must be distributive " do
      a = StaticSet.new([1])
      b = StaticSet.new([1, 2, 3])
      c = StaticSet.new([3, 4, 1])
      (a | (b.∩ c)).should eq((a | b).∩ (a | c))
    end

    it "can be used with an empty set (identity)" do
      a = [1, 2, 3]
      (StaticSet.new(a) | StaticSet(Int32).new).should eq(StaticSet.new(a))
    end

    it "must be idempotent" do
      a = [1, 2, 3]
      (StaticSet.new(a) | StaticSet.new(a)).should eq(StaticSet.new(a))
    end

    it "must follow the domination law" do
      a = [1]
      u = [1, 2, 3]
      (StaticSet.new(a) | StaticSet.new(u)).should eq(StaticSet.new(u))
    end
  end

  describe "#intersection" do
    it "should return a set that contains elements that are in both sets" do
      StaticSet.new([1, 0, -1, -2, -3]).intersection(StaticSet.new([1, 2, 3])).should eq(StaticSet.new([1]))
    end

    it "can use ∩ as an alias" do
      (StaticSet.new([-1, 0, 1]).∩ StaticSet.new([1, 2, 3])).should eq(StaticSet.new([1]))
    end

    it "must be associative" do
      a = [1, 2, 3]
      b = [2, 3, 4, 5]
      c = [0, -1, -2, -3]
      set1 = (StaticSet.new(a).∩ StaticSet.new(b)).∩ StaticSet.new(c)
      set2 = StaticSet.new(a).∩ (StaticSet.new(b).∩ StaticSet.new(c))
      set1.should eq(set2)
    end

    it "must be commutative" do
      a = [1, 2, 3]
      b = [2, 3, 4, 5]
      (StaticSet.new(a).∩ StaticSet.new(b)).should eq(StaticSet.new(b).∩ StaticSet.new(a))
    end

    it "must be distributive " do
      a = StaticSet.new([1])
      b = StaticSet.new([1, 2, 3])
      c = StaticSet.new([3, 4, 1])
      (a.∩ (b | c)).should eq((a.∩ b) | (a.∩ c))
    end

    it "has an identity expression" do
      a = [1, 2, 3]
      b = [1, 2, 3, 4, 5]
      (StaticSet.new(a).∩ StaticSet.new(b)).should eq(StaticSet.new(a))
    end

    it "must be idempotent" do
      a = [1, 2, 3]
      (StaticSet.new(a).∩ StaticSet.new(a)).should eq(StaticSet.new(a))
    end

    it "must follow the domination law" do
      a = [1, 2, 3]
      u = [] of Int32
      (StaticSet.new(a).∩ StaticSet.new(u)).should eq(StaticSet.new(u))
    end
  end

  describe "#difference" do
    it "should return a set of elements that are not in the second set" do
      b = StaticSet.new([2, 3, 4])
      a = StaticSet.new([1, 2, 3])
      c = StaticSet.new([1])

      b.difference(a).should eq(c)
    end

    it "can use - as an alias" do
      b = StaticSet.new([2, 3, 4])
      a = StaticSet.new([1, 2, 3])
      c = StaticSet.new([1])

      (b - a).should eq(c)
    end
  end

  describe "#subset?" do
    it "should return true if the two sets are equivalent" do
      StaticSet.new([1, 2, 3]).subset?(StaticSet.new([1, 2, 3])).should eq(true)
    end

    it "should return true if the first set is a subset of the second set" do
      StaticSet.new([1, 3]).subset?(StaticSet.new([1, 2, 3])).should eq(true)
    end

    it "should return false if the first set contains elements not in the second" do
      StaticSet.new([5, 3]).subset?(StaticSet.new([1, 2, 3])).should eq(false)
      StaticSet.new([1, 2, 3, 4]).subset?(StaticSet.new([1, 2, 3])).should eq(false)
    end
  end

  describe "#superset?" do
    it "should return true if the two sets are equivalent" do
      StaticSet.new([1, 2, 3]).superset?(StaticSet.new([1, 2, 3])).should eq(true)
    end

    it "should return true if the first set is a superset of the second set" do
      StaticSet.new([1, 2, 3]).superset?(StaticSet.new([1, 3])).should eq(true)
    end

    it "should return false if the second set contains elements not in the first" do
      StaticSet.new([1, 2, 3]).superset?(StaticSet.new([6, 3])).should eq(false)
      StaticSet.new([1, 2, 3]).superset?(StaticSet.new([1, 2, 3, 4])).should eq(false)
    end
  end
end
