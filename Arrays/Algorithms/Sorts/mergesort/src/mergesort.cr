# TODO: Write documentation for `Mergesort`
module Mergesort(T)
  VERSION = "0.1.0"

  def self.merge_sort(array : Array(T))
    return array if array.size <= 1

    left = [] of T
    right = [] of T

    array.each.with_index do |x, i|
      if i < (array.size)/2
        left << x
      else
        right << x
      end
    end

    merge(merge_sort(left), merge_sort(right))
  end

  def self.merge(left : Array(T), right : Array(T))
    result = [] of T

    until left.empty? || right.empty?
      result << (left.first <= right.first ? left.shift : right.shift)
    end

    result + left + right
  end
end
