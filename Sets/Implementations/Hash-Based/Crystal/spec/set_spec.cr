require "./spec_helper"

describe NewSet do
  # TODO: Write tests

  describe "#initialize" do
    it "can be initialized without any arguments" do
      p NewSet::BaseSet(Int32).new
    end

    it "can be initialized from an enumerable" do
      a = NewSet::BaseSet.new [1, 2, 3]
      p a
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
end
