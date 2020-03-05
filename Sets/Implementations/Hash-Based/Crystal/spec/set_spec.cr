require "./spec_helper"

describe NewSet do
  # TODO: Write tests

  describe "#initialize" do
    it "can be initialized without any arguments" do
      NewSet::BaseSet(Int32).new
    end

    it "can be initialized from an enumerable" do
      a = NewSet::BaseSet.new [1, 2, 3]
    end
  end

  describe "#to_a" do
    it "should turn a set into an array based on its values" do
      NewSet::BaseSet.new([1, 2, 2]).to_a.should eq([1, 2])
    end
  end

  describe "#to_s" do
    it "should turn a set into a string based on its values" do
      NewSet::BaseSet.new([1, 2, 3]).to_s.should eq("{1, 2, 3}")
    end
  end

  describe "#inspect" do
    it "should 'return' the set as a string with brackets" do
      NewSet::BaseSet(Int32).new.inspect.should eq("{}")
    end
  end

  describe "#add" do
    it "can push a value of the same type" do
      set = NewSet::BaseSet(Int32).new
      set.add 1
    end

    it "can use << as an alias" do
      set = NewSet::BaseSet(Int32).new
      set << 1
    end
  end

  describe "#union" do
    it "should return a set that contains elements from both sets" do
      NewSet::BaseSet(Int32).new.union(NewSet::BaseSet.new([1, 2, 3]))
    end
  end
end
