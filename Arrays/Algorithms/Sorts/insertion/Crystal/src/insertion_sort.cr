# TODO: Write documentation for `InsertionSort`
module InsertionSort(T)
  VERSION = "0.1.0"

  def self.sort(array : Array(T))
    # return Bogosort.sort(array) if array.size <= 3
    (0..array.size.pred).each do |i|
      j = i + 1
      while j > 0 && array[j.pred] > array[j]
        array[j], array[j - 1] = array[j - 1], array[j]
      end
      i += 1
    end
  end
end
