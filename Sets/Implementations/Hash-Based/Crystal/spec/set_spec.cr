require "./spec_helper"
include NewSet

describe NewSet do
  # TODO: Write tests

  describe "#initialize" do
    it "can be initialized without any arguments" do
      BaseSet(Int32).new
    end

    it "can be initialized from an enumerable" do
      a = BaseSet.new [1, 2, 3]
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
      set.add 1
    end

    it "can use << as an alias" do
      set = BaseSet(Int32).new
      set << 1
    end
  end

  describe "#union" do
    it "should return a set that contains elements from both sets" do
      BaseSet(Int32).new.union(BaseSet.new([1, 2, 3]))
    end

    it "can use | as an alias" do
      BaseSet(Int32).new | (BaseSet.new([1, 2, 3]))
    end

    it "must be commutative" do
      a = [1, 2, 3]
      b = [2, 3, 4, 5]
      BaseSet.new(a) | BaseSet.new(b) || BaseSet.new(b) | BaseSet.new(a)
    end
  end
end
