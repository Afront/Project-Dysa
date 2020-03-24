require "./spec_helper"

describe Mergesort do
  # TODO: Write tests

  describe "hi" do
    it "merges" do
      Mergesort.merge_sort([2, 1, 3]).should eq([1, 2, 3])
    end
  end
end
