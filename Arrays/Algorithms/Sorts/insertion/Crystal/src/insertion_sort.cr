# TODO: Write documentation for `InsertionSort`
module InsertionSort(T)
  VERSION = "0.1.0"

  def self.sort(array : Array(T))
    array.size.times do |i|
      while i > 0 && array[i.pred] > array[i]
        array[i], array[i.pred] = array[i.pred], array[i]
        i -= 1
      end
    end
    array
  end
end
