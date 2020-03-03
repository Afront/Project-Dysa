# TODO: Write documentation for `Bogosort`
module Bogosort
  VERSION = "0.1.0"

  def self.sorted(array)
    array.each_cons(2).all? { |i| i[0] <= i[1] }
  end

  def self.sort(array : Array)
    until sorted(array)
      array.shuffle!
    end
    array
  end
end
