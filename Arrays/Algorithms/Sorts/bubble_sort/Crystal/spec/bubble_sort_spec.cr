require "./spec_helper"

describe BubbleSort do
  it "works for floats" do
    BubbleSort.sort([2.5, 1]).should eq([1, 2.5])
    BubbleSort.sort([1.0]).should eq([1.0])
    BubbleSort.sort([51.2, 2.1, 3.4, Math::PI]).should eq([2.1, Math::PI, 3.4, 51.2])
  end

  it "works for ints" do
    BubbleSort.sort([2, 1]).should eq([1, 2])
    BubbleSort.sort([1]).should eq([1])
    BubbleSort.sort([5, 2, 3]).should eq([2, 3, 5])
  end

  it "works for strings" do
    BubbleSort.sort(%w[they are you]).should eq(%w[are they you])
  end
end
