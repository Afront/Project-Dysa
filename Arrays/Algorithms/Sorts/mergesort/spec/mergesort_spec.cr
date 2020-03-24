require "./spec_helper"

describe Mergesort do
  # TODO: Write tests

  describe "hi" do
    it "merges correctly" do
      Mergesort.merge_sort([2, 1, 3]).should eq([1, 2, 3])
      Mergesort.merge_sort([2, 3, 5, 1, 3]).should eq([1, 2, 3, 3, 5])
    end
  end
end
