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
      (BaseSet.new(a) | BaseSet.new(b)).should eq(BaseSet.new(b) | BaseSet.new(a))
    end

    it "can be used with an empty set (identity)" do
      (BaseSet.new([1, 2, 3]) | BaseSet(Int32).new).should eq(BaseSet.new([1, 2, 3]))
    end
  end
end
