# frozen_string_literal: true

require 'bubble_sort/version'

module BubbleSort
  class Error < StandardError; end

  def self.sorted(words)
    words.each_cons(2).all? { |a, b| a <= b }
  end

  def self.sort(words)
    until sorted words
      words.length.pred.times do |i|
        next unless words[i] > words[i + 1]

        words[i], words[i + 1] = words[i + 1], words[i]
      end
    end
    words
  end
end
