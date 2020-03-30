# TODO: Write documentation for `InsertionSort`
module InsertionSort(T)
  VERSION = "0.1.0"

  def self.sort(array : Array(T))
    array.size.times do |i|
      j = i
      while j > 0 && array[j.pred] > array[j]
        array[j], array[j.pred] = array[j.pred], array[j]
        j -= 1
      end
    end
    array
  end
end
