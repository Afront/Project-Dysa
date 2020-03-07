require "./spec_helper"
include NewSet

describe NewSet do
  # TODO: Write tests

  describe "#initialize" do
    it "can be initialized without any arguments" do
      BaseSet(Int32).new
    end

    it "can be initialized from an enumerable" do
      BaseSet.new [1, 2, 3]
    end

    it "should only 'keep' one 'copy' of each element" do
      BaseSet.new([1, 2, 2, 3]).should eq(BaseSet.new([1, 2, 2, 3]))
    end
  end

  describe "#to_a" do
    it "should turn a set into an array based on its values" do
      BaseSet.new([1, 2, 2]).to_a.should eq([1, 2])
    end
  end

  describe "#to_s" do
    it "should turn a set into a string based on its values" do
      BaseSet.new([1, 2, 3]).to_s.should eq("{1, 2, 3}")
    end
  end

  describe "#inspect" do
    it "should 'return' the set as a string with brackets" do
      BaseSet(Int32).new.inspect.should eq("{}")
    end
  end

  describe "#add" do
    it "can push a value of the same type" do
      set = BaseSet(Int32).new
      set.add(1).should eq(BaseSet.new([1]))
    end

    it "can use << as an alias" do
      set = BaseSet(Int32).new
      new_set = set << 1
      new_set.should eq(BaseSet.new([1]))
    end
  end

  describe "#union" do
    it "should return a set that contains elements from both sets" do
      BaseSet.new([-1, -2, -3]).union(BaseSet.new([1, 2, 3])).should eq(BaseSet.new([-1, -2, -3, 1, 2, 3]))
    end

    it "can use | as an alias" do
      (BaseSet.new([-1, -2, -3]) | BaseSet.new([1, 2, 3])).should eq(BaseSet.new([-1, -2, -3, 1, 2, 3]))
    end

    it "can use ∪ as an alias" do
      (BaseSet.new([-1, -2, -3]).∪ BaseSet.new([1, 2, 3])).should eq(BaseSet.new([-1, -2, -3, 1, 2, 3]))
    end

    it "must be associative" do
      a = [1, 2, 3]
      b = [2, 3, 4, 5]
      c = [0, -1, -2, -3]
      set1 = (BaseSet.new(a) | BaseSet.new(b)) | BaseSet.new(c)
      set2 = BaseSet.new(a) | (BaseSet.new(b) | BaseSet.new(c))
      set1.should eq(set2)
    end

    it "must be commutative" do
      a = [1, 2, 3]
      b = [2, 3, 4, 5]
      (BaseSet.new(a).∪ BaseSet.new(b)).should eq(BaseSet.new(b).∪ BaseSet.new(a))
    end

    it "must be distributive " do
      a = BaseSet.new([1])
      b = BaseSet.new([1, 2, 3])
      c = BaseSet.new([3, 4, 1])
      (a | (b.∩ c)).should eq((a | b).∩ (a | c))
    end

    it "can be used with an empty set (identity)" do
      a = [1, 2, 3]
      (BaseSet.new(a) | BaseSet(Int32).new).should eq(BaseSet.new(a))
    end

    it "must be idempotent" do
      a = [1, 2, 3]
      (BaseSet.new(a) | BaseSet.new(a)).should eq(BaseSet.new(a))
    end

    it "must follow the domination law" do
      a = [1]
      u = [1, 2, 3]
      (BaseSet.new(a) | BaseSet.new(u)).should eq(BaseSet.new(u))
    end
  end

  describe "#intersection" do
    it "should return a set that contains elements that are in both sets" do
      BaseSet.new([1, 0, -1, -2, -3]).intersection(BaseSet.new([1, 2, 3])).should eq(BaseSet.new([1]))
    end

    it "can use ∩ as an alias" do
      (BaseSet.new([-1, 0, 1]).∩ BaseSet.new([1, 2, 3])).should eq(BaseSet.new([1]))
    end

    it "must be associative" do
      a = [1, 2, 3]
      b = [2, 3, 4, 5]
      c = [0, -1, -2, -3]
      set1 = (BaseSet.new(a).∩ BaseSet.new(b)).∩ BaseSet.new(c)
      set2 = BaseSet.new(a).∩ (BaseSet.new(b).∩ BaseSet.new(c))
      set1.should eq(set2)
    end

    it "must be commutative" do
      a = [1, 2, 3]
      b = [2, 3, 4, 5]
      (BaseSet.new(a).∩ BaseSet.new(b)).should eq(BaseSet.new(b).∩ BaseSet.new(a))
    end

    it "must be distributive " do
      a = BaseSet.new([1])
      b = BaseSet.new([1, 2, 3])
      c = BaseSet.new([3, 4, 1])
      (a.∩ (b | c)).should eq((a.∩ b) | (a.∩ c))
    end

    it "has an identity expression" do
      a = [1, 2, 3]
      b = [1, 2, 3, 4, 5]
      (BaseSet.new(a).∩ BaseSet.new(b)).should eq(BaseSet.new(a))
    end

    it "must be idempotent" do
      a = [1, 2, 3]
      (BaseSet.new(a).∩ BaseSet.new(a)).should eq(BaseSet.new(a))
    end

    it "must follow the domination law" do
      a = [1, 2, 3]
      u = [] of Int32
      (BaseSet.new(a).∩ BaseSet.new(u)).should eq(BaseSet.new(u))
    end
  end

  describe "#difference" do
    it "should return a set of elements that are not in the second set" do
      b = BaseSet.new([2, 3, 4])
      a = BaseSet.new([1, 2, 3])
      c = BaseSet.new([1])

      b.difference(a).should eq(c)
    end

    it "can use - as an alias" do
      b = BaseSet.new([2, 3, 4])
      a = BaseSet.new([1, 2, 3])
      c = BaseSet.new([1])

      (b - a).should eq(c)
    end
  end

  describe "#subset?" do
    it "should return true if the two sets are equivalent" do
      BaseSet.new([1, 2, 3]).subset?(BaseSet.new([1, 2, 3])).should eq(true)
    end

    it "should return true if the first set is a subset of the second set" do
      BaseSet.new([1, 3]).subset?(BaseSet.new([1, 2, 3])).should eq(true)
    end

    it "should return false if the first set contains elements not in the second" do
      BaseSet.new([5, 3]).subset?(BaseSet.new([1, 2, 3])).should eq(false)
      BaseSet.new([1, 2, 3, 4]).subset?(BaseSet.new([1, 2, 3])).should eq(false)
    end
  end

  describe "#superset?" do
    it "should return true if the two sets are equivalent" do
      BaseSet.new([1, 2, 3]).superset?(BaseSet.new([1, 2, 3])).should eq(true)
    end

    it "should return true if the first set is a superset of the second set" do
      BaseSet.new([1, 2, 3]).superset?(BaseSet.new([1, 3])).should eq(true)
    end

    it "should return false if the second set contains elements not in the first" do
      BaseSet.new([1, 2, 3]).superset?(BaseSet.new([6, 3])).should eq(false)
      BaseSet.new([1, 2, 3]).superset?(BaseSet.new([1, 2, 3, 4])).should eq(false)
    end
  end
end
