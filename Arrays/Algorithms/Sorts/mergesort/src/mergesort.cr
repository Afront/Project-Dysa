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

    left = merge_sort(left)
    right = merge_sort(right)

    merge(left, right)
  end

  def self.merge(left, right)
    result = [] of T

    until left.empty? || right.empty?
      if left.first <= right.first
        result << left.pop
      else
        result << right.pop
      end

      until left.empty?
        result << left.pop
      end

      until right.empty?
        result << right.pop
      end

      result
    end
  end
end
