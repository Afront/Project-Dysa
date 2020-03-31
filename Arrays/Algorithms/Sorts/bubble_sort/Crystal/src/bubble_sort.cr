# TODO: Write documentation for `BubbleSort`
module BubbleSort
  VERSION = "0.1.0"

  def self.sorted(array)
    array.each_cons(2).all? { |i| i[0] <= i[1] }
  end

  def self.sort(array)
    until sorted array
      array.size.pred.times do |i|
        next unless array[i] > array[i.succ]

        array[i], array[i.succ] = array[i.succ], array[i]
      end
    end
    array
  end
end
