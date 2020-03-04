require "./spec_helper"

describe AllNearestSmallerValues do
  it "works" do
    input_array = [0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15]
    result = [0, 0, 4, 0, 2, 2, 6, 0, 1, 1, 5, 1, 3, 3, 7]
    AllNearestSmallerValues.get_all_nearest_smaller_values(input_array).should eq(result)
  end
end
