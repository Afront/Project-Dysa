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
end
