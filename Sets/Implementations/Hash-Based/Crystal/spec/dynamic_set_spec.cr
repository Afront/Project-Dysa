describe DynamicSet do
  describe "#initialize" do
    it "can be initialized without any arguments" do
      DynamicSet(Int32).new
    end

    it "can be initialized with a capacity" do
      DynamicSet(Int32).new(2)
    end

    it "can be initialized from an enumerable" do
      DynamicSet.new [1, 2, 3]
    end

    it "should only 'keep' one 'copy' of each element" do
      DynamicSet.new([1, 2, 2, 3]).should eq(DynamicSet.new([1, 2, 3]))
    end

    it "can create a new set based on the arguments" do
      DynamicSet.new 1, 2, 3
    end
  end

  describe "#add" do
    it "can push a value of the same type" do
      set = DynamicSet(Int32).new
      set.add(1).should eq(DynamicSet.new([1]))
    end

    it "can use << as an alias" do
      set = DynamicSet(Int32).new
      new_set = set << 1
      new_set.should eq(DynamicSet.new([1]))
    end

    it "can ignore the capacity if the capacity is not fixed" do
      set = DynamicSet(Int32).new(1) # equivalent to DynamicSet(Int32).new(capacity: 1, fixed: false)
      set.add(1)
      set.add(2)
      set.add(3).should eq(DynamicSet.new([1, 2, 3]))
    end

    it "raises OverflowError if the capacity is fixed" do
      set = DynamicSet(Int32).new(0, fixed: true)
      expect_raises(OverflowError, "Set overflow: the size of the set exceeds the capacity") do
        set.add(1)
      end
    end
  end

  describe "#add?" do
    it "can push a value of the same type" do
      set = DynamicSet(Int32).new
      set.add?(1).should eq(DynamicSet.new([1]))
    end

    it "can ignore the capacity if the capacity is not fixed" do
      set = DynamicSet(Int32).new(1) # equivalent to DynamicSet(Int32).new(capacity: 1, fixed: false)
      set.add?(1)
      set.add?(2)
      set.add?(3).should eq(DynamicSet.new([1, 2, 3]))
    end

    it "returns itself if the size of the length exceeds the fixed capacity" do
      set = DynamicSet(Int32).new(0, fixed: true)
      set.add?(3).should eq(DynamicSet(Int32).new)
    end
  end

  describe "StaticSet methods" do
    describe "#to_a" do
      it "should turn a set into an array based on its values" do
        DynamicSet.new([1, 2, 2]).to_a.should eq([1, 2])
      end
    end

    describe "#to_s" do
      it "should turn a set into a string based on its values" do
        DynamicSet.new([1, 2, 3]).to_s.should eq("{1, 2, 3}")
      end
    end

    describe "#inspect" do
      it "should 'return' the set as a string with brackets" do
        DynamicSet(Int32).new.inspect.should eq("{}")
      end
    end

    describe "#union" do
      it "should return a set that contains elements from both sets" do
        DynamicSet.new([-1, -2, -3]).union(DynamicSet.new([1, 2, 3])).should eq(DynamicSet.new([-1, -2, -3, 1, 2, 3]))
      end

      it "can use | as an alias" do
        (DynamicSet.new([-1, -2, -3]) | DynamicSet.new([1, 2, 3])).should eq(DynamicSet.new([-1, -2, -3, 1, 2, 3]))
      end

      it "can use ∪ as an alias" do
        (DynamicSet.new([-1, -2, -3]).∪ DynamicSet.new([1, 2, 3])).should eq(DynamicSet.new([-1, -2, -3, 1, 2, 3]))
      end

      it "must be associative" do
        a = [1, 2, 3]
        b = [2, 3, 4, 5]
        c = [0, -1, -2, -3]
        set1 = (DynamicSet.new(a) | DynamicSet.new(b)) | DynamicSet.new(c)
        set2 = DynamicSet.new(a) | (DynamicSet.new(b) | DynamicSet.new(c))
        set1.should eq(set2)
      end

      it "must be commutative" do
        a = [1, 2, 3]
        b = [2, 3, 4, 5]
        (DynamicSet.new(a).∪ DynamicSet.new(b)).should eq(DynamicSet.new(b).∪ DynamicSet.new(a))
      end

      it "must be distributive " do
        a = DynamicSet.new([1])
        b = DynamicSet.new([1, 2, 3])
        c = DynamicSet.new([3, 4, 1])
        (a | (b.∩ c)).should eq((a | b).∩ (a | c))
      end

      it "can be used with an empty set (identity)" do
        a = [1, 2, 3]
        (DynamicSet.new(a) | DynamicSet(Int32).new).should eq(DynamicSet.new(a))
      end

      it "must be idempotent" do
        a = [1, 2, 3]
        (DynamicSet.new(a) | DynamicSet.new(a)).should eq(DynamicSet.new(a))
      end

      it "must follow the domination law" do
        a = [1]
        u = [1, 2, 3]
        (DynamicSet.new(a) | DynamicSet.new(u)).should eq(DynamicSet.new(u))
      end
    end

    describe "#intersection" do
      it "should return a set that contains elements that are in both sets" do
        DynamicSet.new([1, 0, -1, -2, -3]).intersection(DynamicSet.new([1, 2, 3])).should eq(DynamicSet.new([1]))
      end

      it "can use ∩ as an alias" do
        (DynamicSet.new([-1, 0, 1]).∩ DynamicSet.new([1, 2, 3])).should eq(DynamicSet.new([1]))
      end

      it "must be associative" do
        a = [1, 2, 3]
        b = [2, 3, 4, 5]
        c = [0, -1, -2, -3]
        set1 = (DynamicSet.new(a).∩ DynamicSet.new(b)).∩ DynamicSet.new(c)
        set2 = DynamicSet.new(a).∩ (DynamicSet.new(b).∩ DynamicSet.new(c))
        set1.should eq(set2)
      end

      it "must be commutative" do
        a = [1, 2, 3]
        b = [2, 3, 4, 5]
        (DynamicSet.new(a).∩ DynamicSet.new(b)).should eq(DynamicSet.new(b).∩ DynamicSet.new(a))
      end

      it "must be distributive " do
        a = DynamicSet.new([1])
        b = DynamicSet.new([1, 2, 3])
        c = DynamicSet.new([3, 4, 1])
        (a.∩ (b | c)).should eq((a.∩ b) | (a.∩ c))
      end

      it "has an identity expression" do
        a = [1, 2, 3]
        b = [1, 2, 3, 4, 5]
        (DynamicSet.new(a).∩ DynamicSet.new(b)).should eq(DynamicSet.new(a))
      end

      it "must be idempotent" do
        a = [1, 2, 3]
        (DynamicSet.new(a).∩ DynamicSet.new(a)).should eq(DynamicSet.new(a))
      end

      it "must follow the domination law" do
        a = [1, 2, 3]
        u = [] of Int32
        (DynamicSet.new(a).∩ DynamicSet.new(u)).should eq(DynamicSet.new(u))
      end
    end

    describe "#difference" do
      it "should return a set of elements that are not in the second set" do
        b = DynamicSet.new([2, 3, 4])
        a = DynamicSet.new([1, 2, 3])
        c = DynamicSet.new([1])

        b.difference(a).should eq(c)
      end

      it "can use - as an alias" do
        b = DynamicSet.new([2, 3, 4])
        a = DynamicSet.new([1, 2, 3])
        c = DynamicSet.new([1])

        (b - a).should eq(c)
      end
    end

    describe "#subset?" do
      it "should return true if the two sets are equivalent" do
        DynamicSet.new([1, 2, 3]).subset?(DynamicSet.new([1, 2, 3])).should eq(true)
      end

      it "should return true if the first set is a subset of the second set" do
        DynamicSet.new([1, 3]).subset?(DynamicSet.new([1, 2, 3])).should eq(true)
      end

      it "should return false if the first set contains elements not in the second" do
        DynamicSet.new([5, 3]).subset?(DynamicSet.new([1, 2, 3])).should eq(false)
        DynamicSet.new([1, 2, 3, 4]).subset?(DynamicSet.new([1, 2, 3])).should eq(false)
      end
    end

    describe "#superset?" do
      it "should return true if the two sets are equivalent" do
        DynamicSet.new([1, 2, 3]).superset?(DynamicSet.new([1, 2, 3])).should eq(true)
      end

      it "should return true if the first set is a superset of the second set" do
        DynamicSet.new([1, 2, 3]).superset?(DynamicSet.new([1, 3])).should eq(true)
      end

      it "should return false if the second set contains elements not in the first" do
        DynamicSet.new([1, 2, 3]).superset?(DynamicSet.new([6, 3])).should eq(false)
        DynamicSet.new([1, 2, 3]).superset?(DynamicSet.new([1, 2, 3, 4])).should eq(false)
      end
    end
  end
end
