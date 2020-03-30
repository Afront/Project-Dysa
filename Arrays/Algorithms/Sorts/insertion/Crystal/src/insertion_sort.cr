# TODO: Write documentation for `InsertionSort`
module InsertionSort(T)
  VERSION = "0.1.0"

  def self.sort(array : Array(T))
    # return Bogosort.sort(array) if array.size <= 3
    1.upto(array.size) do |i|
      j = i.pred
      while j >= 0 && array[j] > array[j.succ]
        array[j.succ] = array[j]
        j -= 1
      end
      array[j.succ] = array[j]
    end
  end
end
